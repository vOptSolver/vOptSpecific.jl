# vOptSpecific: part of vOptSolver for structured problems

**vOptSolver** is a solver of multiobjective linear optimization problems (MOCO, MOIP, MOMILP, MOLP).
This repository concerns **vOptSpecific**, the part of vOptSolver devoted to **multiobjective structured problems** (currently available: 2LAP). With vOptSpecific, the problem is expressed using an Application Programming Interface.

We suppose you are familiar with vOptSolver; if not, read first this [presentation](https://voptsolver.github.io/vOptSolver/).


## Instructions 

### Installation Instructions
For a local use, a working version of:
- Julia must be ready; instructions for the installation are available [here](https://julialang.org/downloads/)
- your favorite C/C++ compiler must be ready (GCC is suggested)

Before your first local or distant use, 
1. run Julia and when the terminal is ready, 
2. add as follow the two mandatory packages to your Julia distribution: 

```
julia> Pkg.clone("http://github.com/vOptSolver/vOptSpecific.jl")
julia> Pkg.build("vOptSpecific")
```

That's all folk; at this point, vOptSpecific is properly installed.

### Usage Instructions

When vOptSpecific is properly installed,

On linux or in the cloud (juliaBox):

1. open a console on your computer or in the cloud
2. when the prompt is ready, type in the console `julia`

On macOS:

1. locate the application `julia` and click on the icon, the julia console appears


When the prompt `julia` is ready, type in the console;
```
julia> using vOptSpecific
```
vOptSpecific is ready. See examples for further informations. 
Have fun with the solver!


## Examples 
The folder `examples` provides (1) source code of problems ready to be solved and (2) selected datafiles into different formats.

