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

const sumDistancePerMonthDocument = gql`
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

const getSumDistancePerMonth = async () => {
  const response = await client.request<Query>(sumDistancePerMonthDocument);
  return response.sumByMonth;
}

export function displayAllRunningLogGraph(element: HTMLCanvasElement) {
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

export function displaySumDistancePerMonthGraph(element: HTMLCanvasElement) {
  const result = getSumDistancePerMonth();
  result.then((sum) => {
    new Chart(element, {
      type: 'bar',
      data: {
        labels: sum.map((r) => r.yearAndMonth),
        datasets: [{
          label: 'Sum of Distance per Month',
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
