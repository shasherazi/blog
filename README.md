<a name="readme-top"></a>

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Usage](#usage)
- [👥 Author](#author)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)

- [📝 License](#license)

# 📖 Blog <a name="about-project"></a>

Blog is a personal blog app which supports posts, comments, and likes. Built with Rails.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

- <a href="https://www.ruby-lang.org/">Ruby</a>
- <a href="https://rubyonrails.org/">Rails</a>
- <a href="https://www.postgresql.org/">PostgreSQL</a>

### Key Features <a name="key-features"></a>

- Create posts.
- List all the posts.
- Add comments and likes to a post.
- See all comments and likes in a post.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💻 Getting Started <a name="getting-started"></a>

### Prerequisites

To run this project you need the following dependencies:

 - Ruby: `3.1.3+`
 - Rails: `7.0.4.3+`
 - PostgreSQL: `15.2+`

### Setup

- Clone this repository to your local machine:
```sh
  git clone git@github.com:shasherazi/blog.git
  cd blog
```
- Install dependencies:
```sh
  bundle install
```
- Create environment variables `POSTGRESQL_USER` and `POSTGRESQL_PASSWORD` or edit `config/database.yml` with your database connection info.

- Recreate Data Base:
```sh
  rake db:schema:load
```

### Usage

To run the project, execute the following command in the terminal:

```  sh
  cd blog
  rails s  
```

## 👥 Author <a name="author"></a>

👤 **Syed Hassan Askri**

- GitHub: [shasherazi](https://github.com/shasherazi)
- Twitter: [shasherazi](https://twitter.com/shasherazi)
- LinkedIn: [shasherazi](https://www.linkedin.com/in/shasherazi)

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🔭 Future Features <a name="future-features"></a>

- Add validations to the model.
- Create controllers.
- Create a web interface.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/shasherazi/blog/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## ⭐️ Show your support <a name="support"></a>

Give a ⭐️ if you like this project!

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank the Microverse community for their support and guidance.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
