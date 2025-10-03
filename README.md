# SpendWise

A comprehensive personal finance management application that helps users track their expenses, create budgets, and manage financial goals. Built with Ruby on Rails API backend and React frontend.

## 🚀 Features

### Budget Management
- **Create and manage budgets** for different financial goals
- **Set financial targets** for each budget
- **Track progress** towards your financial objectives
- **User-specific budgets** with secure access control

### Transaction Tracking
- **Record expenses** with detailed descriptions
- **Categorize transactions** for better organization
- **Track spending patterns** across different categories
- **Date-based transaction filtering**

### Category Management
- **Create custom spending categories**
- **Organize transactions** by category
- **Flexible category system** for personalized financial tracking

### User Authentication
- **Secure user registration** and login
- **JWT-based authentication** for API security
- **User-specific data isolation**
- **Role-based access control**

## 🏗️ Tech Stack

### Backend (API)
- **Ruby on Rails 6.1.3** - Web framework
- **PostgreSQL** - Database
- **Devise + JWT** - Authentication
- **JSONAPI Serializer** - API responses
- **RSpec** - Testing framework
- **Puma** - Web server

### Frontend
- **React** - User interface
- **Create React App** - Development environment
- **Modern JavaScript (ES6+)**

### DevOps & Tools
- **Rack CORS** - Cross-origin resource sharing
- **Spring** - Application preloader
- **Bootsnap** - Fast boot times

## 📦 Installation & Setup

### Prerequisites
- Ruby 2.7.4
- Rails 6.1.3+
- PostgreSQL
- Node.js & npm
- Git

### Clone the Repository
```bash
git clone <repository-url>
cd spendwise
```

### Backend Setup

1. **Install Ruby dependencies:**
```bash
bundle install
```

2. **Setup database:**
```bash
rails db:create
rails db:migrate
rails db:seed
```

3. **Start the Rails server:**
```bash
rails server
```
The API will be available at `http://localhost:3000`

### Frontend Setup

1. **Navigate to client directory:**
```bash
cd client
```

2. **Install dependencies:**
```bash
npm install
```

3. **Start the React development server:**
```bash
npm start
```
The frontend will be available at `http://localhost:3000`

## 🛠️ Development

### Running Tests
```bash
# Run backend tests
bundle exec rspec

# Run frontend tests
cd client && npm test
```

### Database Commands
```bash
# Create database
rails db:create

# Run migrations
rails db:migrate

# Seed database
rails db:seed

# Reset database
rails db:reset
```

### Development Scripts
```bash
# Start both frontend and backend
./bin/start

# Setup development environment
./bin/setup
```

## 📡 API Endpoints

### Authentication
- `POST /login` - User login
- `POST /signup` - User registration
- `DELETE /logout` - User logout

### Budgets
- `GET /api/v1/budgets` - List user budgets
- `POST /api/v1/budgets` - Create new budget
- `GET /api/v1/budgets/:id` - Get specific budget
- `PATCH /api/v1/budgets/:id` - Update budget
- `DELETE /api/v1/budgets/:id` - Delete budget

### Transactions
- `GET /api/v1/budgets/:budget_id/transactions` - List budget transactions
- `POST /api/v1/budgets/:budget_id/transactions` - Create transaction
- `GET /api/v1/budgets/:budget_id/transactions/:id` - Get specific transaction
- `PATCH /api/v1/budgets/:budget_id/transactions/:id` - Update transaction
- `DELETE /api/v1/budgets/:budget_id/transactions/:id` - Delete transaction

### Categories
- `GET /api/v1/categories` - List all categories
- `POST /api/v1/categories` - Create new category
- `GET /api/v1/categories/:id` - Get specific category
- `PATCH /api/v1/categories/:id` - Update category
- `DELETE /api/v1/categories/:id` - Delete category

## 🏛️ Database Schema

### Users
- `email` - User email (unique)
- `encrypted_password` - Hashed password
- `name` - User's full name
- `role` - User role
- `jti` - JWT token identifier

### Budgets
- `name` - Budget name
- `financial_goal` - Target amount
- `user_id` - Owner reference

### Categories
- `name` - Category name (unique)

### Transactions
- `amount` - Transaction amount
- `description` - Transaction description
- `date` - Transaction date
- `budget_id` - Associated budget
- `category_id` - Transaction category

## 🔒 Security Features

- **Password encryption** using bcrypt
- **JWT-based authentication** for stateless sessions
- **CORS configuration** for secure cross-origin requests
- **Input validation** and sanitization
- **User-specific data isolation**

## 🚀 Deployment

The application is configured for deployment with:
- **Render.com** compatibility
- **Production-ready configuration**
- **Environment-specific settings**

### Environment Variables
Set the following environment variables for production:
- `RAILS_MASTER_KEY` - Rails credentials key
- `DATABASE_URL` - PostgreSQL connection string
- `JWT_SECRET_KEY` - JWT secret for token signing

## 📝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Development Guidelines
- Follow Ruby style guide for backend code
- Use ESLint/Prettier for frontend formatting
- Write tests for new features
- Update documentation for API changes

## 📄 License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

## 🤝 Support

If you have any questions or need help getting started, please:
1. Check the documentation above
2. Search existing issues
3. Create a new issue with detailed information

## 🔮 Future Enhancements

- **Dashboard analytics** with spending insights
- **Budget vs actual** spending comparisons
- **Recurring transaction** support
- **Export functionality** for financial data
- **Mobile app** using React Native
- **Multi-currency** support
- **Financial goal** tracking and visualization
