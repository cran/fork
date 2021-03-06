# $Id: kill.R 1495 2011-09-01 23:36:31Z warnes $

kill <- function(pid, signal=15)
  {
    .C("Rfork_kill",
       as.integer(pid),
       as.integer(signal),
       flag=integer(1),
       PACKAGE="fork"
       )$flag
  }

killall <- function(signal=15)
  {
    if(!exists(".pidlist",where=.GlobalEnv))
      warning("No processes to kill, ignored.")
    for(pid in get(".pidlist",pos=.GlobalEnv))
      kill(pid, signal)
    invisible()
  }
