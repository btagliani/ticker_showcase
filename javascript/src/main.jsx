import React from "react";
import ReactDOM from "react-dom/client";
import {
  legacy_createStore as createStore,
  applyMiddleware,
  combineReducers,
} from "redux";
import { Provider } from "react-redux";
import { thunk } from "redux-thunk";
import stockReducer from "./reducers/stockReducer"; // Ensure the path to your reducer is correct
import App from "./App.jsx";
import "./index.css";

const rootReducer = combineReducers({
  stockData: stockReducer,
});

const store = createStore(rootReducer, applyMiddleware(thunk));

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <React.StrictMode>
    <Provider store={store}>
      <App />
    </Provider>
  </React.StrictMode>
);
