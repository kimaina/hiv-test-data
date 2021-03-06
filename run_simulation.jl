using HIVTestData
using BusinessDays
using Random
using Dates
using DataFrames
using TimeZones

simulation_parameters = SimulationParameters(
  "simulation_output",    # output directory
  BusinessDays.WeekendsOnly(), # holiday calendar
  MersenneTwister(Random.make_seed()), # rng
  Date(2015, 1, 1),       # start date
  Date(2021, 1, 1),       # end date
  Time("9:00"),           # day start
  Time("5:00"),           # day end
  tz"UTC",                # timezone
  300_000,                # patient pool size (initial)
  .1,                     # pool growth rate
  .505,                   # % male
  .495,                   # % female
  [.217, .214, .181, .16, .119, .072, .03, .007, .001],
  [.203, .204, .176, .159, .123, .081, .04, .013, .001],
  1433.5,                 # avg # visits / day
  240.5,                  # std # visits / day
  25.6,                   # avg # new patients / day
  6.7,                    # std # new patients / day
  313.06,                 # avg # ltfu / week
  90.34,                  # std # ltfu /week
  Month(3),               # period btw visits (unsuppressed)
  Month(12),              # period btw vl visits (suppressed)
  [.00075, .00128, .0019, .00401, .00879, .01786,
   .04473, .13392, .13392],
  .1,                     # % data missing
  .13,                    # % missed appointments
  .22                     # % ART failures
)

run_simulation(simulation_parameters)
