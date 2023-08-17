import './style.css'
import { displayGraph } from './displayGraph.ts'

document.querySelector<HTMLDivElement>('#app')!.innerHTML = `
  <div>
    <h1>Running Logs</h1>
    <div style="position:relative;width:1300px;height:700px;">
      <canvas id="myChart"></canvas>
    </div>
  </div>
`

displayGraph(document.querySelector<HTMLCanvasElement>('#myChart')!)
