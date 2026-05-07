import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  // Define que vamos manipular um elemento chamado 'menu'
  static targets = ["menu", "iconOpen", "iconClose"]

  declare readonly menuTarget: HTMLElement
  declare readonly iconOpenTarget: HTMLElement
  declare readonly iconCloseTarget: HTMLElement

  connect() {
    // Garante que começa fechado
    this.menuTarget.classList.add("hidden")
  }

  toggle() {
    // Alterna a visibilidade do menu
    this.menuTarget.classList.toggle("hidden")
    // Alterna os ícones (Hambúrguer vs X)
    this.iconOpenTarget.classList.toggle("hidden")
    this.iconCloseTarget.classList.toggle("hidden")
  }
}