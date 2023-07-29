import './style.css'
import { displayGraph } from './displayGraph.ts'

document.querySelector<HTMLDivElement>('#app')!.innerHTML = `
  <div>
    <h1>Vite + TypeScript</h1>
    <div>
      <canvas id="myChart"></canvas>
    </div>
  </div>
`

displayGraph(document.querySelector<HTMLCanvasElement>('#myChart')!)
