import "@hotwired/turbo-rails";
import { Application } from "@hotwired/stimulus";
import { definitionsFromContext } from "@hotwired/stimulus-webpack-helpers";

const context = require.context("../controllers", true, /\.js$/u);

Application.start().load(definitionsFromContext(context));
