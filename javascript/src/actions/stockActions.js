export const fetchStockDataBegin = () => ({
  type: 'FETCH_STOCK_DATA_BEGIN'
});

export const fetchStockDataSuccess = stockData => ({
  type: 'FETCH_STOCK_DATA_SUCCESS',
  payload: { stockData }
});

export const fetchStockDataFailure = error => ({
  type: 'FETCH_STOCK_DATA_FAILURE',
  payload: { error }
});

export const fetchStockData = ticker => {
  return dispatch => {
    dispatch(fetchStockDataBegin());
    return fetch(`/api/v1/stocks?ticker=${ticker}`)
      .then(handleErrors)
      .then(res => res.json())
      .then(json => {
        dispatch(fetchStockDataSuccess(json));
        return json;
      })
      .catch(error => dispatch(fetchStockDataFailure(error)));
  };
};

function handleErrors(response) {
  if (!response.ok) {
    throw Error(response.statusText);
  }
  return response;
}
