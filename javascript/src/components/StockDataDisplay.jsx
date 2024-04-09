import { useSelector } from "react-redux";
import "./StockDataDisplay.css";

function StockDataDisplay() {
  const stockState = useSelector((state) => state.stockData);
  const isLoading = useSelector((state) => state.isLoading);

  const { stockData } = stockState;

  if (isLoading) return <p>Loading...</p>;

  return (
    <div>
      {stockData ? (
        <table>
          <thead>
            <tr>
              <th>Item</th>
              <th>Maximum</th>
              <th>Minimum</th>
              <th>Average</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>Price</td>
              <td>${stockData.max_price}</td>
              <td>${stockData.min_price}</td>
              <td>${stockData.average_price}</td>
            </tr>
            <tr>
              <td>Volume</td>
              <td>{stockData.max_volume}</td>
              <td>{stockData.min_volume}</td>
              <td>{stockData.average_volume}</td>
            </tr>
          </tbody>
        </table>
      ) : (
        <p>No data available. Please submit a ticker.</p>
      )}
    </div>
  );
}

export default StockDataDisplay;
