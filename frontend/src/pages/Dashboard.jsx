import { useEffect, useState } from 'preact/hooks';
import { Bar } from 'react-chartjs-2';
import 'chart.js/auto';
import '../styles/Dashboard.css';

const Dashboard = () => {
  const [projects, setProjects] = useState([]);
  const [filteredProjects, setFilteredProjects] = useState([]);
  const [inflow, setInflow] = useState(0);
  const [outflow, setOutflow] = useState(0);
  const [standing, setStanding] = useState(0);
  const [totalBills, setTotalBills] = useState(0);
  const [selectedProject, setSelectedProject] = useState('');
  const [selectedDateRange, setSelectedDateRange] = useState([null, null]);
  const [userRole, setUserRole] = useState('');

  useEffect(() => {
    setUserRole(localStorage.getItem('userRole') || '');
  }, []);

  if (userRole === 'site engineer') {
    return <p>You do not have access to this page.</p>;
  }

  useEffect(() => {
    fetch('http://103.191.241.13:4000/projects/?skip=0&limit=100')
      .then((response) => response.json())
      .then((data) => {
        setProjects(data);
        setFilteredProjects(data);
        calculateMetrics(data);
      });
  }, []);

  const applyFilters = () => {
    let filtered = [...projects];

    if (selectedProject) {
      filtered = filtered.filter((project) => project.id === selectedProject);
    }

    if (selectedDateRange[0] && selectedDateRange[1]) {
      const [startDate, endDate] = selectedDateRange;
      filtered = filtered.filter((project) =>
        project.daily_billings.some((bill) => {
          const billDate = new Date(bill.date);
          return billDate >= new Date(startDate) && billDate <= new Date(endDate);
        })
      );
    }

    setFilteredProjects(filtered);
    calculateMetrics(filtered);
  };

  const calculateMetrics = (projectsToCalculate) => {
    let totalInflow = 0;
    let totalOutflow = 0;
    let totalDue = 0;

    projectsToCalculate.forEach((project) => {
      project.payments.forEach((payment) => {
        totalInflow += payment.amount;
      });

      project.daily_billings.forEach((bill) => {
        totalOutflow += bill.paid;
        totalDue += bill.due; // Assume bill.due is the total bill amount
      });
    });

    setInflow(totalInflow);
    setOutflow(totalOutflow);
    setStanding(totalInflow - totalOutflow);
    setTotalBills(totalDue - totalOutflow);
  };

  const handleProjectChange = (e) => {
    setSelectedProject(e.target.value);
  };

  const handleDateRangeChange = (e, index) => {
    setSelectedDateRange((prev) => {
      const newRange = [...prev];
      newRange[index] = e.target.value;
      return newRange;
    });
  };

  useEffect(() => {
    applyFilters();
  }, [selectedProject, selectedDateRange]);

  const aggregateDailyBills = () => {
    const billMap = new Map();

    filteredProjects.forEach((project) => {
      project.daily_billings.forEach((bill) => {
        if (billMap.has(bill.description)) {
          const existing = billMap.get(bill.description);
          existing.paid += bill.paid;
          existing.due += bill.due; // Using bill.due as the total bill amount
        } else {
          billMap.set(bill.description, { paid: bill.paid, due: bill.due }); // Total bill amount
        }
      });
    });

    return [...billMap.entries()].map(([description, { paid, due }]) => ({
      description,
      paid,
      actualDue: due - paid, // Calculate actual due by subtracting paid from the total bill amount
      totalBill: due, // Store total bill amount
    }));
  };

  const dailyBillsData = aggregateDailyBills();

  const dailyBillsChartData = {
    labels: dailyBillsData.map((bill) => bill.description),
    datasets: [
      {
        label: 'Paid',
        data: dailyBillsData.map((bill) => bill.paid),
        borderColor: 'blue',
        backgroundColor: 'rgba(54, 162, 235, 0.6)',
      },
      {
        label: 'Actual Due',
        data: dailyBillsData.map((bill) => bill.actualDue),
        borderColor: 'orange',
        backgroundColor: 'rgba(255, 159, 64, 0.6)',
      },
      {
        label: 'Total Bill Amount',
        data: dailyBillsData.map((bill) => bill.totalBill),
        borderColor: 'green',
        backgroundColor: 'rgba(75, 192, 192, 0.6)',
      },
    ],
  };

  const inflowByProjectData = () => {
    const projectMap = new Map();

    filteredProjects.forEach((project) => {
      let totalInflow = 0;
      project.payments.forEach((payment) => {
        totalInflow += payment.amount;
      });
      projectMap.set(project.name, totalInflow);
    });

    return [...projectMap.entries()].map(([name, amount]) => ({
      name,
      amount,
    }));
  };

  const outflowByProjectData = () => {
    const projectMap = new Map();

    filteredProjects.forEach((project) => {
      let totalOutflow = 0;
      project.daily_billings.forEach((bill) => {
        totalOutflow += bill.paid;
      });
      projectMap.set(project.name, totalOutflow);
    });

    return [...projectMap.entries()].map(([name, amount]) => ({
      name,
      amount,
    }));
  };

  const inflowData = inflowByProjectData();
  const outflowData = outflowByProjectData();

  const inflowChartData = {
    labels: inflowData.map((item) => item.name),
    datasets: [
      {
        label: 'Inflow by Project',
        data: inflowData.map((item) => item.amount),
        backgroundColor: 'rgba(54, 162, 235, 0.6)',
      },
    ],
  };

  const outflowChartData = {
    labels: outflowData.map((item) => item.name),
    datasets: [
      {
        label: 'Outflow by Project',
        data: outflowData.map((item) => item.amount),
        backgroundColor: 'rgba(255, 99, 132, 0.6)',
      },
    ],
  };

  // Monthly inflow/outflow data
  const monthlyInflowOutflowData = () => {
    const monthlyData = {};
    
    filteredProjects.forEach((project) => {
      project.payments.forEach((payment) => {
        const date = new Date(payment.date);
        const monthYear = `${date.getFullYear()}-${date.getMonth() + 1}`;
        if (!monthlyData[monthYear]) {
          monthlyData[monthYear] = { inflow: 0, outflow: 0 };
        }
        monthlyData[monthYear].inflow += payment.amount;
      });

      project.daily_billings.forEach((bill) => {
        const date = new Date(bill.date);
        const monthYear = `${date.getFullYear()}-${date.getMonth() + 1}`;
        if (!monthlyData[monthYear]) {
          monthlyData[monthYear] = { inflow: 0, outflow: 0 };
        }
        monthlyData[monthYear].outflow += bill.paid;
      });
    });

    return Object.entries(monthlyData).map(([monthYear, { inflow, outflow }]) => ({
      monthYear,
      inflow,
      outflow,
    }));
  };

  const monthlyData = monthlyInflowOutflowData();

  const monthlyChartData = {
    labels: monthlyData.map((data) => data.monthYear),
    datasets: [
      {
        label: 'Monthly Inflow',
        data: monthlyData.map((data) => data.inflow),
        backgroundColor: 'rgba(54, 162, 235, 0.6)',
      },
      {
        label: 'Monthly Outflow',
        data: monthlyData.map((data) => data.outflow),
        backgroundColor: 'rgba(255, 99, 132, 0.6)',
      },
    ],
  };

  const options = {
    scales: {
      x: {
        title: {
          display: true,
          text: 'Description',
        },
      },
      y: {
        title: {
          display: true,
          text: 'Amount (BDT)',
        },
        beginAtZero: true,
      },
    },
  };

  const monthlyOptions = {
    scales: {
      x: {
        title: {
          display: true,
          text: 'Month',
        },
      },
      y: {
        title: {
          display: true,
          text: 'Amount (BDT)',
        },
        beginAtZero: true,
      },
    },
  };

  return (
    <div>
      <h1>Dashboard</h1>

      <div className="cards">
        <div className="card">
          <h2>Inflow</h2>
          <p>{inflow.toLocaleString('en-IN')} BDT</p>
        </div>
        <div className="card">
          <h2>Outflow</h2>
          <p>{outflow.toLocaleString('en-IN')} BDT</p>
        </div>
        <div className="card">
          <h2>Inflow Standing</h2>
          <p>{standing.toLocaleString('en-IN')} BDT</p>
        </div>
        <div className="card">
          <h2>Outstanding Bills</h2>
          <p>{totalBills.toLocaleString('en-IN')} BDT</p>
        </div>
      </div>

      <div className="chart">
        <h2>Inflow by Project</h2>
        <Bar data={inflowChartData} options={options} />
      </div>

      <div className="chart">
        <h2>Outflow by Project</h2>
        <Bar data={outflowChartData} options={options} />
      </div>

      <div className="chart">
        <h2>Daily Bills</h2>
        <Bar data={dailyBillsChartData} options={options} />
      </div>

      <div className="chart">
        <h2>Monthly Inflow and Outflow</h2>
        <Bar data={monthlyChartData} options={monthlyOptions} />
      </div>
    </div>
  );
};

export default Dashboard;
