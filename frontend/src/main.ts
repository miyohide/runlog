import './style.css'
import { displayAllRunningLogGraph, displaySumDistancePerMonthGraph } from './displayGraph.ts'

document.querySelector<HTMLDivElement>('#app')!.innerHTML = `
  <div>
    <h1>Running Logs</h1>
    <div style="position:relative;width:1300px;height:700px;">
      <canvas id="myChart"></canvas>
    </div>
    <div style="position:relative;width:1300px;height:700px;">
      <canvas id="distance_per_month"></canvas>
    </div>
  </div>
`

displayAllRunningLogGraph(document.querySelector<HTMLCanvasElement>('#myChart')!)
displaySumDistancePerMonthGraph(document.querySelector<HTMLCanvasElement>('#distance_per_month')!)
