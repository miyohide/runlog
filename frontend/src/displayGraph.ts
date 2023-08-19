import Chart from "chart.js/auto";
import { Query } from "./generated/graphql";
import { GraphQLClient, gql } from "graphql-request";

const endpoint = 'http://localhost:3000/graphql';
const client = new GraphQLClient(endpoint);
const document = gql`
{
  runlogs {
      id
      runningDate
      distance
  }
}
`

const getData = async () => {
  const response = await client.request<Query>(document);
  return response.runlogs;
}

export function displayGraph(element: HTMLCanvasElement) {
  const result = getData();

  result.then((runlogs) => {
    new Chart(element, {
      type: 'line',
      data: {
        labels: runlogs.map((r) => r.runningDate),
        datasets: [{
          label: 'Running log',
          data: runlogs.map((r) => r.distance),
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
