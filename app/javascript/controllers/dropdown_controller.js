import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown"
export default class extends Controller {
  connect() {
    this.fetchData("make")
  }

  make(event) {
    const select = event.target
    this.selectedMake = select.options[select.selectedIndex].text

    this.fetchData("model", select.value)
  }

  model(event) {
    const select = event.target
    this.selectedModel = select.options[select.selectedIndex].text

    this.fetchData("year", select.value, "year")
  }

  year(event) {
    const select = event.target
    this.selectedYear = select.options[select.selectedIndex].text
    const mmy = `${this.selectedYear} ${this.selectedMake} ${this.selectedModel}`
    document.getElementById("message-container").classList.remove("hidden")
    document.getElementById("message").innerHTML = mmy
  }

  fetchData(item, parent, name = "name") {
    const items = `${item}s`
    const path = [parent, items].join("/")
    fetch(path)
      .then(response => response.json())
      .then(data => { this.createOptionsFor(item, data, name) })
  }

  createOptionsFor(id, data, name = "name") {
    const dropdown = document.getElementById(id)
    dropdown.innerHTML = `<option>- Please select -</option>`
    data.forEach(item => {
      const opt = document.createElement("option")
      opt.value = item.id
      opt.innerHTML = item[`${name}`]
      dropdown.appendChild(opt)
    })
  }
}
