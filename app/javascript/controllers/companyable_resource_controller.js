import { Controller } from "@hotwired/stimulus";

const LOADER_CLASSES = "absolute bg-gray-100 opacity-10 w-full h-full";

export default class extends Controller {
  static targets = ["companyFieldInput", "modelFieldInput", "submodelFieldInput", "companyHasManyWrapper", "modelBelongsToWrapper", "submodelBelongsToWrapper"];

  static values = {
    view: String,
  };

  // Te fields initial value
  static initialValue;

  get placeholder() {
    return this.modelFieldInputTarget.ariaPlaceholder;
  }

  set loading(isLoading) {
    if (isLoading) {
      // create a loader overlay
      const loadingDiv = document.createElement("div");
      loadingDiv.className = LOADER_CLASSES;
      loadingDiv.dataset.target = "model-loader";

      // add the loader overlay
      this.modelBelongsToWrapperTarget.prepend(loadingDiv);
      this.modelBelongsToWrapperTarget.classList.add("opacity-50");
    } else {
      // remove the loader overlay
      this.modelBelongsToWrapperTarget
        .querySelector('[data-target="model-loader"]')
        .remove();
      this.modelBelongsToWrapperTarget.classList.remove("opacity-50");
    }
  }

  async connect() {
    // Add the controller functionality only on forms
    if (["edit", "new"].includes(this.viewValue)) {
      this.captureTheInitialValue();

      // Trigger the change on load
      await this.onCompanyChange();
    }
  }

  // Read the company select.
  // If there's any value selected show the models and prefill them.
  async onCompanyChange() {
    if (this.hasCompanyFieldInputTarget && this.companyFieldInputTarget) {
      // Get the company
      const company = this.companyFieldInputTarget.value;

      // Dynamically fetch the models for this company
      const models = await this.fetchModelsForCompany(company);

      // Clear the select of options
      Object.keys(this.modelFieldInputTarget.options).forEach(() => {
        this.modelFieldInputTarget.options.remove(0);
      });

      // Add blank option
      this.modelFieldInputTarget.add(new Option(this.placeholder));

      // Add the new models
      models.forEach((model) => {
        this.modelFieldInputTarget.add(new Option(model.name, model.id));
      });

      // Check if the initial value is present in the models array and select it.
      // If not, select the first item
      const currentOptions = Array.from(this.modelFieldInputTarget.options).map(
        (item) => item.value
      );
      if (currentOptions.includes(this.initialValue)) {
        this.modelFieldInputTarget.value = this.initialValue;
      } else {
        // Select the first item
        this.modelFieldInputTarget.value =
          this.modelFieldInputTarget.options[0].value;
      }
    }
  }

  // Read the model select.
  // If there's any value selected show the submodels and prefill them.
  async onModelChange() {
    if (this.hasCompanyFieldInputTarget && this.companyFieldInputTarget) {
      // Get the company
      const company = this.companyFieldInputTarget.value;

      // Get the model
      const model = this.modelFieldInputTarget.value;

      // Dynamically fetch the models for this company
      const submodels = await this.fetchSubmodelsForModel(model);

      // Clear the select of options
      Object.keys(this.submodelFieldInputTarget.options).forEach(() => {
        this.submodelFieldInputTarget.options.remove(0);
      });

      // Add blank option
      this.submodelFieldInputTarget.add(new Option(this.placeholder));

      // Add the new models
      submodels.forEach((submodel) => {
        this.submodelFieldInputTarget.add(new Option(submodel.name, submodel.id));
      });

      // Check if the initial value is present in the models array and select it.
      // If not, select the first item
      const currentOptions = Array.from(this.submodelFieldInputTarget.options).map(
        (item) => item.value
      );
      if (currentOptions.includes(this.initialValue)) {
        this.submodelFieldInputTarget.value = this.initialValue;
      } else {
        // Select the first item
        this.submodelFieldInputTarget.value =
          this.submodelFieldInputTarget.options[0].value;
      }
    }
  }

  // Private

  captureTheInitialValue() {
    this.initialValue = this.modelFieldInputTarget.value;
  }

  async fetchModelsForCompany(company) {
    if (!company) {
      return [];
    }

    this.loading = true;

    const response = await fetch(
      `${window.Avo.configuration.root_path}/companies/models?company=${company}`
    );
    const data = await response.json();

    this.loading = false;

    return data;
  }

  async fetchSubmodelsForModel(model) {
    if (!model) {
      return [];
    }

    this.loading = true;

    const response = await fetch(
      `${window.Avo.configuration.root_path}/companies/models/submodels?model=${model}`
    );
    const data = await response.json();

    this.loading = false;

    return data;
  }
}