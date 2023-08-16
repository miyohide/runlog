import Chart from "chart.js/auto";
import { ApolloClient, InMemoryCache, gql } from "@apollo/client/core";

const client = new ApolloClient({
  uri: 'http://localhost:3000/graphql',
  cache: new InMemoryCache(),
});

const getData = async () => {
  const response = await client.query({
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
  return response.data.runlogs;
}

export function displayGraph(element: HTMLCanvasElement) {
  const result = getData();

  result.then((runlogs) => {
    new Chart(element, {
      type: 'line',
      data: {
        labels: runlogs.map((r: { runningDate: any; }) => r.runningDate),
        datasets: [{
          label: '# of Votes',
          data: runlogs.map((r: { distance: any; }) => r.distance),
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
