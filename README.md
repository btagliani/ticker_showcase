# PortraitSpa Full Stack Application

This project is a single-page application that allows users to input a stock ticker symbol and displays the average stock price, maximum/minimum volume, and maximum/minimum stock price for a given date range.

## Features

- Input field for stock ticker symbol.
- Display average stock price, maximum/minimum volume, and maximum/minimum stock price.
- Responsive design for various screen sizes.

## Technologies Used

- Frontend: React.js with Hooks
- State Management: Redux
- Backend: Ruby on Rails API
- External API: Polygon.io

## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

- Node.js
- npm or yarn
- Ruby on Rails
- PostgreSQL (or change the database configuration as needed)
- Overmind (optional) for running multiple processes
  - Install Overmind: `brew install overmind`

### Installation

1. Clone the repository:

   ```sh
   git clone git@github.com:btagliani/portrait_spa.git
   ```

2. Install Ruby dependencies:

   ```sh
   bundle install
   ```

3. Install Node.js dependencies:

   ```sh
    npm install
    ```

4. Create the database:

   ```sh
   rails db:create
   rails db:migrate
   ```

5. Start the servers:

   ```sh
    overmind s
    ```

6. Open your browser and navigate to `http://localhost:5173/`.

## Usage

Enter a valid stock ticker symbol in the input field and click the 'Submit' button to view the stock data.

## Running Tests

To run tests, run the following command:

```sh
rspec
```
