import Chart from "chart.js/auto";
import { ApolloClient, InMemoryCache, gql } from "@apollo/client/core";

const client = new ApolloClient({
  uri: 'http://localhost:3000/graphql',
  cache: new InMemoryCache(),
});

const getData = async () => {
  const response = client.query({
    query: gql`
    {
        runlogs {
            id
            runningDate
            distance
        }
    }
    `,
  });
  return response;
}


// const getData = async () => {
//   const response = await fetch(`${apiURL}`);
//   if (response.ok) {
//     return await response.json();
//   } else {
//     return Promise.reject(response.status);
//   }
// }

export function displayGraph(element: HTMLCanvasElement) {
  const result = getData();

  result.then((data) => {
    new Chart(element, {
      type: 'line',
      data: {
        labels: data.data.runlogs.map((r) => r.runningDate),
        datasets: [{
          label: '# of Votes',
          data: data.data.runlogs.map((r) => r.distance),
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
