# Kanban IAED (Project 1) - Tests

This repository contains tests for the 1st project (Kanban) for IAED 2020/2021.

## FAQ

FAQs about the Kanban project itself (not these tests) can be found on the [`FAQ.md`](./FAQ.md) file.

## Using this in your own project

To use this to test your own project, here are the requisites you must meet:

- Be running a Unix system (Linux or MacOS). This should also work on a VM and WSL.
- Have all your `.c` and `.h` in one folder.
- Have `git`, `diff`, `gcc` and `make` installed on your system (probably already installed).
- Have a Makefile in your project directory that compiles your project to a single executable.

### Clone this repository

Start by cloning this repository using `git`.  
**DO NOT CLONE THIS INSIDE YOUR OTHER PROJECT FOLDER, ESPECIALLY IF THAT'S ALSO A GIT REPOSITORY**  
You can clone this anywhere in your system.

```bash
git clone https://github.com/diogotcorreia/kanban-iaed-tests.git
```

### Configure

Then, you have to create the configuration file.
To do that, copy the `config.default` file to `config` and edit it accordingly.

```bash
cd kanban-iaed-tests # go into this repository's folder if you haven't already
cp config.default config # create the configuration file from the default
nano config # edit the file as you'd like. You can use another editor, like 'vim', 'emacs', etc.
```

### Run the tests

To run the tests, just run `make` in this repository's folder:

```bash
make
```

It will create various `.diff` files in the `tests` directory and tell you which tests fail and which tests pass.

### Update the tests

The tests will be updated frequently on this repository.
To make sure you're running an up-to-date copy, just pull from the repository using:

```bash
git pull
```

## About the tests

There are two types of tests:

- Official tests (called `tXX.in`/`tXX.out`)  
  Made available by the teachers
- Community tests (called `ctXXX.in`/`ctXXX.out`)  
  Made by other students

### Contribute

Community tests are _extremely_ welcome!
Feel free to submit a PR.
