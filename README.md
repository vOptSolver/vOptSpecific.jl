# vOptSpecific: part of vOptSolver for structured problems

**vOptSolver** is a solver of multiobjective linear optimization problems (MOCO, MOILP, MOMILP, MOLP).
This repository concerns **vOptSpecific**, the part of vOptSolver devoted to **multiobjective structured problems**. With vOptSpecific, the problem is expressed using an Application Programming Interface.

We suppose you are familiar with vOptSolver; if not, read first this [presentation](https://voptsolver.github.io/vOptSolver/).


## Instructions 

### Installation Instructions
For a local use, a working version of:
- Julia must be ready; instructions for the installation are available [here](https://julialang.org/downloads/)
- your favorite MILP solver must be ready (mandatory for dealing with non-structured problems; GLPK is suggested); 
  instructions for the installation are available [here](http://jump.readthedocs.io/en/latest/installation.html)

Before your first local or distant use, run Julia and when the terminal is ready, add as follow the two mandatory packages to your Julia distribution: 


```
julia> Pkg.add("JuMP")
julia> Pkg.clone("vOptSolver")
```

That's all folk! 

### Usage Instructions

Install it, and then have fun with vOptSolver. 


## Examples: 
Problems ready to be solved are in folder examples

