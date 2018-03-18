# Fortran hash table {#mainpage}

The module `dictionary_m` implements a "<string,string>" hash table based on the djb2 hash
function.

    program example_from_readme
      use dictionary_m
      implicit none

      type(dictionary_t) :: d

      call d%init(1024)

      call d%set('one', 'one')
      call d%set('pi', '3.14159')

      write(*,*) 'one', ' = ', d%get('one')
      write(*,*) 'pi', ' = ', d%get('pi')

    end program example_from_readme


**Author:** Pierre de Buyl

**License:** BSD

## Project goals

- Demonstrate a hash table in Fortran.
- Use standard Fortran 2008.
- Single file implementation.
- No dependency.
- No preprocessing.
- Not design a generic container, `dictionary_m` just stores strings. It is of course
  possible to replace the "value" entry in the type `entry_t` for a single-datatype
  dictionary.


The hash table is based on plain allocatable arrays and the base data is stored in `(len=:),
allocatable` character variables. Buckets are extended arbitrarily but reallocating, thus
collisions will slow down this implementation with respect to others using better data
structures.

The goal is not to beat other implementations performance-wise but to provide the
convenience for Fortran programmers to store configuration settings, or other auxiliary data
easily.


## Installation

`dictionary_m` consists of a single Fortran file. You can just drop `src/dictionary_m.f90`
in your Fortran project.

## Coverage

If you read this page from the "GitHub pages" website, you can access the coverage data
generated from lcov [here](coverage/index.html).
