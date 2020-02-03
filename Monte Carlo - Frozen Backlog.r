#Monte Carlo in R

#tp_distribution - Vector with the Throughput values for the project by time-box
#timebox - X axis, for the delivery prediction
#remaining_work_items - Quantity of work items remaining to finish the release/project
#runs - Quantity of times that each iteration will run for
#projection - Vector with the delivery percentages, by time-box
#analysis_duration - Quantity of future time-boxes that will be in the projection

#——————————————————————————————————————————
monte_carlo_frozen_backlog <- function(analysis_duration, remaining_work_items, tp_distribution, runs)
{
  projection = 1:analysis_duration
  timebox = 0	
  
	#Selects a random value from the throughput distribution, sums it to the work items already finished and checks if it was enough to finish the backlog
  iteration <- function()
  {
		rnd_selection = sample(tp_distribution, timebox, replace=T)
		sum(rnd_selection) >= remaining_work_items
	}

	#Allocates the percentage of "True" values in the projection vector, by timebox
	while(timebox < analysis_duration)
	{
		timebox = timebox + 1
		successes_sum = sum(replicate(runs, iteration()))
		projection[timebox] = successes_sum/runs
	}

	#Returns the percentage of "Trues" in the amount of runs selected
	return(cat(projection,sep="\n"))
}
