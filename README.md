# IEMAP-MI Jupyter Notebook Project

This project demonstrates how to use the iemap-mi Python module within a Jupyter notebook environment. It provides examples of interacting with the IEMAP (Integrated Environment for Materials and Processes) Management Interface.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Features](#features)
- [Contributing](#contributing)
- [License](#license)

## Prerequisites

Before you begin, ensure you have met the following requirements:
* You have installed Python 3.10 or later
* You have a Jupyter notebook environment set up
* You have an account on the IEMAP platform (https://iemap.enea.it/)

## Installation

To use this project, follow these steps:

1. Clone this repository:
```bash
git clone https://github.com/SergioEanX/how-to-iemap-mi

```

2. Navigate to the project directory:
```bash
cd how-to-iemap-mi
```

3. Install the required packages:
```bash
poetry install
```


## Usage
1. Start your Jupyter notebook server:
```bash
poetry run jupyter notebook
```
2. Open the `IEMAP_MI_Demo.ipynb` notebook
3. Run the cells in order, following the instructions within the notebook

## Features

This project demonstrates how to:

- Authenticate with the IEMAP platform
- Query and iterate through projects
- Create new projects
- Add files to projects
- Fetch statistical data from the IEMAP database

## Contributing

Contributions to this project are welcome. To contribute:

1. Fork this repository
2. Create a branch: `git checkout -b <branch_name>`
3. Make your changes and commit them: `git commit -m '<commit_message>'`
4. Push to the original branch: `git push origin <project_name>/<location>`
5. Create the pull request

Alternatively, see the GitHub documentation on [creating a pull request](https://help.github.com/articles/creating-a-pull-request/).

## License

This project uses the following license: [MIT License](https://opensource.org/licenses/MIT).

## Contact

If you want to contact the maintainer, you can reach out at <a href="mailto:sergio.ferlito@enea.it?subject=Support IEMAP-MI API">here</a>
 

## Acknowledgements

- This project makes use of the [iemap-mi](https://pypi.org/project/iemap-mi/) Python module
- Special thanks to the IEMAP team for providing the API and documentation
## Run docker container from image
docker run -p 8888:8888 -v /path/on/host:/app/host_files iemap-mi-jupyter