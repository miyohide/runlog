import Chart from "chart.js/auto";
import { Query } from "./generated/graphql";
import { GraphQLClient, gql } from "graphql-request";

const endpoint = 'http://localhost:3000/graphql';
const client = new GraphQLClient(endpoint);
const allRunningLogDocument = gql`
{
  runlogs {
      id
      runningDate
      distance
  }
}
`

const distance_per_month_doc = gql`
{
  sumByMonth {
    yearAndMonth
    distance
  }
}
`

const getAllRunningLog = async () => {
  const response = await client.request<Query>(allRunningLogDocument);
  return response.runlogs;
}

const getDistance = async () => {
  const response = await client.request<Query>(distance_per_month_doc);
  return response.sumByMonth;
}

export function displayGraph(element: HTMLCanvasElement) {
  const result = getAllRunningLog();

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

export function displayGraph2(element: HTMLCanvasElement) {
  const result = getDistance();
  result.then((sum) => {
    new Chart(element, {
      type: 'bar',
      data: {
        labels: sum.map((r) => r.yearAndMonth),
        datasets: [{
          label: 'Running log',
          data: sum.map((r) => r.distance),
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
