# Monte Carlo predicitond for frozen backlogs
   A script to make delivery projections using the Monte Carlo method.
## Running the script
   Open the script in R to load the function and then simply call it, using:
   ```
   monte_carlo_frozen_backlog(analysis_duration, remaining_work_items, tp_distribution, runs)
   ```
   Where:
   ```
   analysis_duration - Quantity of future time-boxes that will be in the projection
   remaining_work_items - Quantity of work items remaining to finish the release/project
   tp_distribution - Vector with the Throughput values for the project by time-box
   runs - Quantity of times that each iteration will run for
   ```
   The script will return the deliry chance percentage by timebox
