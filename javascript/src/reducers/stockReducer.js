const initialState = {
  stockData: {},
  isLoading: false,
  error: null
};

export default function stockReducer(state = initialState, action) {
  switch (action.type) {
    case 'FETCH_STOCK_DATA_BEGIN':
      return {
        ...state,
        isLoading: true,
        error: null
      };
    case 'FETCH_STOCK_DATA_SUCCESS':
      return {
        ...state,
        isLoading: false,
        stockData: action.payload.stockData
      };
    case 'FETCH_STOCK_DATA_FAILURE':
      return {
        ...state,
        isLoading: false,
        error: action.payload.error,
        stockData: {}
      };
    default:
      return state;
  }
}
