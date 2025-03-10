require('dotenv').config();

const express = require('express');
const bodyParser = require('body-parser');
const { Sequelize, DataTypes } = require('sequelize');

const cors = require('cors');


const app = express();
const port = process.env.PORT || 5001;

const sequelize = new Sequelize(
  process.env.DB_NAME,
  process.env.DB_USER,
  process.env.DB_PASSWORD,
  {
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    dialect: 'postgres',
    ssl: {
      rejectUnauthorized: false,
    }
  }
);


app.use(cors({
  origin: 'http://localhost:3000', // Allow requests from React frontend
  methods: 'GET,POST,PUT,DELETE',
  credentials: true
}));

// Middleware
app.use(bodyParser.json());

// Define Book model
const Book = sequelize.define('Book', {
  title: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  author: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  year: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
});

// Sync the database and insert sample data
const initializeDatabase = async () => {
  await sequelize.sync({ force: true });
  const sampleBooks = [
    { title: 'Book 1', author: 'Author 1', year: 2020 },
    { title: 'Book 2', author: 'Author 2', year: 2019 },
    { title: 'Book 3', author: 'Author 3', year: 2021 },
    { title: 'Book 4', author: 'Author 4', year: 2022 },
    { title: 'Book 5', author: 'Author 5', year: 2023 },
  ];

  await Book.bulkCreate(sampleBooks);
};

// API Route to get books
app.get('/api/books', async (req, res) => {
  try {
    const books = await Book.findAll();
    res.json(books);
  } catch (err) {
    res.status(500).json({ message: 'Error fetching books' });
  }
});

// Initialize the database and start the server
initializeDatabase().then(() => {
  app.listen(port, () => {
    console.log(`Server running on port ${port}`);
  });
});
