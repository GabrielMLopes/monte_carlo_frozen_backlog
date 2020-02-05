# Monte Carlo prediction for frozen backlogs
   A script to make delivery projections using the Monte Carlo method.
   
## Running the script
   Open the script in R to load the function and then simply call it, using:
   ```
   monte_carlo_frozen_backlog(analysis_duration, remaining_work_items, tp_distribution, runs)
   ```
   Where:
   ```
   analysis_duration    - Quantity of future time-boxes that will be in the projection
   remaining_work_items - Quantity of work items remaining to finish the release/project
   tp_distribution      - Vector with the Throughput values for the project by time-box
   runs                 - Quantity of times that each iteration will run for
   ```
   The script will return the delivery probability by time-box

## Further explanation of the parameters:

   The first parameter *analysis_duration*, controls the number of iterations that the Monte Carl will run for. The definition of what a iteration is will depend on team context, it may be Sprints, weeks, days, etc. For example, lets say the team uses Sprints and is currently on S19, by setting *analysis_duration* to 30 the script will run a prediction for each Sprint from S20 to S49.

   The second parameter *remaining_work_items*, is the number of work items still not finished that are required to complete a determined scope. This scope could be completing all of the unfinished work, only the work items needed to complete a release, or another scope that makes sense for you team. The definition of a "work item" is also dependent on team context what is important is that they are all of the same type, be it User Stories, or tasks, or sub-tasks, etc.

   The third parameter *tp_distribution*, is a vector with the Throughput values for the last iterations. Like *analysis_duration* what a iteration is will be team dependent, but it's important to use the same unit of measurement in both parameters.

   The forth and last parameter *runs*, is the number of time that the Monte Carlo algorithm will execute for each iteration.

## Some tips to keep in Mind:

   - there is no limit to the vector size for *tp_distribution* and even though the more data the merrier, it's advisable to not bring data from a time so long ago that the context was different that it is today. Context changes might come from changes in the team's size, working on different subject matter, new frameworks, new methodologies, etc.

   - the higher the value for *runs* the closest the Monte Carlo will get to the percentage value mathematically calculated. For more information on the impact of the number of times the Monte Carlo runs, check: https://medium.com/@gabriellopes_55600/monte-carlo-in-practice-finding-the-ideal-iteration-value-b21c66eab50e
