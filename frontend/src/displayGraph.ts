import Chart from "chart.js/auto";

const apiURL = 'http://localhost:3000/';

const getData = async () => {
  const response = await fetch(`${apiURL}`);
  if (response.ok) {
    return await response.json();
  } else {
    return Promise.reject(response.status);
  }
}

export function displayGraph(element: HTMLCanvasElement) {
  const result = getData();

  result.then((data) => {
    new Chart(element, {
      type: 'bar',
      data: {
        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
        datasets: [{
          label: '# of Votes',
          data: data,
          borderWidth: 1
        }]
      },
      options: {
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    });
  })
  .catch((error) => {
    console.log('Error: ' + error);
  })
}
