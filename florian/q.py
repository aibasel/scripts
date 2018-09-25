#! /bin/bash
## squeue -q infai -o "%22i %9P %40j %10u %2t %.10M %.6D %R"
squeue -o "%22i %9P %40j %10u %2t %.10M %.6D %16R %8Q"
