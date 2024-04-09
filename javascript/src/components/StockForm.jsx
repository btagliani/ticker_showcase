import { useState } from "react";
import { useDispatch } from "react-redux";
import { fetchStockData } from "../actions/stockActions";
import "./StockForm.css";

function StockForm() {
  const [ticker, setTicker] = useState("");
  const dispatch = useDispatch();

  const handleSubmit = (e) => {
    e.preventDefault();
    dispatch(fetchStockData(ticker));
  };

  return (
    <form onSubmit={handleSubmit}>
      <label htmlFor="ticker">Stock Ticker:</label>
      <input
        type="text"
        id="ticker"
        value={ticker}
        onChange={(e) => setTicker(e.target.value.toUpperCase())}
      />
      <button type="submit">Submit</button>
    </form>
  );
}

export default StockForm;
