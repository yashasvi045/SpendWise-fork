# Contributing to SpendWise

Thank you for your interest in contributing to **SpendWise**! We appreciate your help in making this personal finance management application better for everyone. Whether you're fixing bugs, adding features, improving documentation, or suggesting enhancements, your contributions are valued.

---

## 📋 Table of Contents

- [Getting Started](#getting-started)
- [Development Setup](#development-setup)
- [Project Structure](#project-structure)
- [Contributing Guidelines](#contributing-guidelines)
- [Coding Standards](#coding-standards)
- [Testing](#testing)
- [Pull Request Process](#pull-request-process)
- [Environment Variables](#environment-variables)
- [API Documentation](#api-documentation)
- [Getting Help](#getting-help)

---

## 🚀 Getting Started

### Prerequisites

Before you begin, ensure you have the following installed on your machine:

#### Required Software

- **Ruby** 2.7.4 or higher
  - Check version: `ruby -v`
  - Install via [rbenv](https://github.com/rbenv/rbenv) or [RVM](https://rvm.io/)
- **Rails** 6.1.3 or higher
  - Check version: `rails -v`
  - Install: `gem install rails`
- **PostgreSQL** (latest stable version)
  - Check version: `psql --version`
  - Install via [PostgreSQL official site](https://www.postgresql.org/download/)
- **Node.js** (LTS version recommended)
  - Check version: `node -v`
  - Install via [Node.js official site](https://nodejs.org/)
- **npm** (comes with Node.js)
  - Check version: `npm -v`
- **Git**
  - Check version: `git --version`
  - Install via [Git official site](https://git-scm.com/)

#### Optional but Recommended

- **Bundler** (Ruby dependency manager)
  - Install: `gem install bundler`
- **Postman** or similar API testing tool
- Code editor (VS Code, Sublime Text, etc.)

---

## 💻 Development Setup

### 1. Fork and Clone the Repository

**Fork the repository:**
1. Go to [https://github.com/Limeload/SpendWise](https://github.com/Limeload/SpendWise)
2. Click the **"Fork"** button in the top right corner

**Clone your fork:**
```bash
git clone https://github.com/YOUR-USERNAME/SpendWise.git
cd SpendWise
```

**Add upstream remote:**
```bash
git remote add upstream https://github.com/Limeload/SpendWise.git
```

### 2. Backend Setup (Ruby on Rails API)

#### Install Ruby Dependencies

```bash
bundle install
```

If you encounter any issues:
```bash
bundle update
bundle install
```

#### Configure Database

**Create database configuration:**

The default database configuration uses PostgreSQL. Ensure PostgreSQL is running:
```bash
# Check if PostgreSQL is running
sudo service postgresql status

# Start PostgreSQL if needed
sudo service postgresql start
```

**Setup the database:**
```bash
# Create the database
rails db:create

# Run migrations
rails db:migrate

# Seed the database with sample data (optional)
rails db:seed
```

**If you need to reset the database:**
```bash
rails db:reset
```

#### Start the Rails Server

```bash
rails server
# or simply
rails s
```

The API will be available at: **http://localhost:3000**

### 3. Frontend Setup (React)

#### Navigate to Client Directory

```bash
cd client
```

#### Install Node Dependencies

```bash
npm install
```

If you encounter dependency conflicts:
```bash
npm install --legacy-peer-deps
```

#### Start the React Development Server

```bash
npm start
```

The frontend will be available at: **http://localhost:3001** (automatically uses port 3001 if 3000 is taken by Rails)

### 4. Running Both Servers Simultaneously

**Option 1: Use the provided script (recommended)**
```bash
./bin/start
```

**Option 2: Run in separate terminal windows**
- Terminal 1: `rails server`
- Terminal 2: `cd client && npm start`

---

## 📁 Project Structure

```text
SpendWise/
├── app/                      # Rails application code
│   ├── controllers/          # API controllers
│   ├── models/              # Database models
│   ├── serializers/         # JSONAPI serializers
│   └── ...
├── client/                   # React frontend
│   ├── public/              # Static assets
│   ├── src/                 # React source code
│   │   ├── components/      # React components
│   │   ├── services/        # API service calls
│   │   ├── utils/           # Utility functions
│   │   └── ...
│   └── package.json         # Frontend dependencies
├── config/                   # Rails configuration
│   ├── routes.rb           # API routes
│   ├── database.yml        # Database configuration
│   └── ...
├── db/                       # Database files
│   ├── migrate/            # Database migrations
│   └── seeds.rb            # Seed data
├── spec/                     # RSpec tests
├── bin/                      # Executable scripts
│   ├── setup               # Development setup script
│   └── start               # Start both servers
├── Gemfile                   # Ruby dependencies
├── package.json             # Backend scripts
└── README.md                # Project documentation
```

---

## 🤝 Contributing Guidelines

### Branching Strategy

We follow a feature branch workflow:

1. **Main Branch (`main`)**: Production-ready code
2. **Feature Branches**: New features or enhancements
3. **Bugfix Branches**: Bug fixes
4. **Hotfix Branches**: Critical fixes for production

#### Branch Naming Convention

```bash
# Features
feature/feature-name
feature/add-recurring-transactions

# Bug fixes
bugfix/issue-description
bugfix/fix-login-error

# Hotfixes
hotfix/critical-issue
hotfix/security-patch

# Documentation
docs/update-readme
docs/api-documentation
```

### Creating a Feature Branch

```bash
# Update your main branch
git checkout main
git pull upstream main

# Create and switch to a new branch
git checkout -b feature/your-feature-name
```

### Making Changes

1. **Write clean, readable code** following our coding standards
2. **Add tests** for new features or bug fixes
3. **Update documentation** if you change APIs or add features
4. **Test thoroughly** before submitting

### Committing Changes

**Use clear, descriptive commit messages:**

```bash
git add .
git commit -m "Add: Brief description of changes"
```

**Commit Message Prefixes:**
- `Add:` - New features or files
- `Fix:` - Bug fixes
- `Update:` - Updates to existing features
- `Remove:` - Removing code or files
- `Refactor:` - Code refactoring without functionality changes
- `Docs:` - Documentation changes
- `Test:` - Adding or updating tests
- `Style:` - Formatting, missing semicolons, etc.

**Examples:**
```bash
git commit -m "Add: recurring transaction feature"
git commit -m "Fix: authentication error on login"
git commit -m "Update: budget calculation logic"
git commit -m "Docs: improve API endpoint documentation"
```

---

## 📝 Coding Standards

### Backend (Ruby on Rails)

#### Ruby Style Guide

Follow the [Ruby Style Guide](https://rubystyle.guide/):

- **Indentation**: 2 spaces (no tabs)
- **Line length**: Maximum 120 characters
- **Naming**: Use snake_case for methods and variables
- **Classes**: Use CamelCase for class names

**Example:**
```ruby
# Good
class BudgetController < ApplicationController
  def create
    @budget = current_user.budgets.create(budget_params)
    if @budget.save
      render json: @budget, status: :created
    else
      render json: @budget.errors, status: :unprocessable_entity
    end
  end

  private

  def budget_params
    params.require(:budget).permit(:name, :financial_goal)
  end
end
```

#### Rails Best Practices

- Use **strong parameters** for mass assignment protection
- Implement **proper error handling** with rescue blocks
- Use **ActiveRecord validations** in models
- Keep controllers **thin** - business logic belongs in models or services
- Use **serializers** for consistent API responses

### Frontend (React)

#### JavaScript Style Guide

Follow modern JavaScript best practices:

- **Indentation**: 2 spaces
- **Quotes**: Single quotes for strings
- **Semicolons**: Use them consistently
- **ES6+**: Use modern JavaScript features (arrow functions, destructuring, etc.)

**Example:**
```javascript
// Good
import React, { useState, useEffect } from 'react';

const BudgetList = ({ userId }) => {
  const [budgets, setBudgets] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchBudgets();
  }, [userId]);

  const fetchBudgets = async () => {
    try {
      const response = await fetch(`/api/v1/budgets?user_id=${userId}`);
      const data = await response.json();
      setBudgets(data);
    } catch (error) {
      console.error('Error fetching budgets:', error);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="budget-list">
      {loading ? <LoadingSpinner /> : <BudgetCards budgets={budgets} />}
    </div>
  );
};

export default BudgetList;
```

#### React Best Practices

- Use **functional components** with hooks
- Keep components **small and focused**
- Use **prop-types** or TypeScript for type checking
- Implement **proper error boundaries**
- Use **async/await** for asynchronous operations
- Follow **component naming conventions** (PascalCase)

#### Code Formatting

We recommend using **ESLint** and **Prettier**:

```bash
# Install in client directory
cd client
npm install --save-dev eslint prettier eslint-config-prettier
```

---

## 🧪 Testing

### Backend Testing (RSpec)

**Run all tests:**
```bash
bundle exec rspec
```

**Run specific test file:**
```bash
bundle exec rspec spec/models/budget_spec.rb
```

**Run with coverage report:**
```bash
COVERAGE=true bundle exec rspec
```

#### Writing Tests

Place tests in the `spec/` directory:

```ruby
# spec/models/budget_spec.rb
require 'rails_helper'

RSpec.describe Budget, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:financial_goal) }
    it { should validate_numericality_of(:financial_goal) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:transactions) }
  end
end
```

### Frontend Testing (Jest/React Testing Library)

**Run all tests:**
```bash
cd client
npm test
```

**Run with coverage:**
```bash
npm test -- --coverage
```

#### Writing Tests

```javascript
// src/components/__tests__/BudgetCard.test.js
import { render, screen } from '@testing-library/react';
import BudgetCard from '../BudgetCard';

describe('BudgetCard', () => {
  const mockBudget = {
    name: 'Groceries',
    financial_goal: 500,
    current_spending: 350
  };

  test('renders budget information correctly', () => {
    render(<BudgetCard budget={mockBudget} />);
    
    expect(screen.getByText('Groceries')).toBeInTheDocument();
    expect(screen.getByText('$500')).toBeInTheDocument();
  });
});
```

---

## 🔄 Pull Request Process

### Before Submitting a PR

- [ ] All tests pass (`bundle exec rspec` and `npm test`)
- [ ] Code follows our coding standards
- [ ] Documentation is updated (if applicable)
- [ ] Commit messages are clear and descriptive
- [ ] Branch is up to date with `main`

### Submitting a Pull Request

1. **Push your branch to your fork:**
```bash
git push origin feature/your-feature-name
```

2. **Create a Pull Request:**
   - Go to the [original repository](https://github.com/Limeload/SpendWise)
   - Click **"Pull Requests"** → **"New Pull Request"**
   - Click **"compare across forks"**
   - Select your fork and branch
   - Fill out the PR template

3. **PR Description Template:**

```markdown
## Description
Brief description of what this PR does.

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Changes Made
- List key changes
- Explain technical decisions
- Mention any dependencies

## Testing
Describe how you tested these changes:
- [ ] Unit tests added/updated
- [ ] Integration tests pass
- [ ] Manual testing performed

## Screenshots (if applicable)
Add screenshots for UI changes

## Related Issues
Closes #[issue number]
```

### PR Review Process

1. **Automated Checks**: CI/CD pipeline runs tests automatically
2. **Code Review**: Maintainers review your code
3. **Feedback**: Address any requested changes
4. **Approval**: Once approved, your PR will be merged

### Updating Your PR

If changes are requested:

```bash
# Make the changes
git add .
git commit -m "Update: address review feedback"
git push origin feature/your-feature-name
```

The PR will automatically update!

---

## 🔐 Environment Variables

### Development Environment

For local development, you may need to configure environment variables. Create a `.env` file in the root directory:

```bash
# .env (DO NOT commit this file!)

# Database
DATABASE_URL=postgresql://localhost/spendwise_development

# JWT Authentication
JWT_SECRET_KEY=your_secret_key_here

# Rails
RAILS_ENV=development
RAILS_MASTER_KEY=your_master_key_here

# Optional: External APIs
# STRIPE_API_KEY=your_stripe_key
# SENDGRID_API_KEY=your_sendgrid_key
```

**Never commit `.env` files to version control!** They're already in `.gitignore`.

### Production Environment

For production deployment (e.g., on Render.com), set these environment variables:

| Variable | Description | Required |
|----------|-------------|----------|
| `RAILS_MASTER_KEY` | Rails credentials encryption key | Yes |
| `DATABASE_URL` | PostgreSQL connection string | Yes |
| `JWT_SECRET_KEY` | Secret key for JWT token signing | Yes |
| `RAILS_ENV` | Set to `production` | Yes |
| `RACK_ENV` | Set to `production` | Yes |

### Accessing Environment Variables

**In Rails:**
```ruby
ENV['JWT_SECRET_KEY']
```

**In React:**
```javascript
process.env.REACT_APP_API_URL
```

> **Note:** React environment variables must be prefixed with `REACT_APP_`

---

## 📚 API Documentation

### Authentication Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/signup` | User registration |
| POST | `/login` | User login |
| DELETE | `/logout` | User logout |

### Budget Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/v1/budgets` | List user budgets |
| POST | `/api/v1/budgets` | Create new budget |
| GET | `/api/v1/budgets/:id` | Get specific budget |
| PATCH | `/api/v1/budgets/:id` | Update budget |
| DELETE | `/api/v1/budgets/:id` | Delete budget |

### Transaction Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/v1/budgets/:budget_id/transactions` | List budget transactions |
| POST | `/api/v1/budgets/:budget_id/transactions` | Create transaction |
| GET | `/api/v1/budgets/:budget_id/transactions/:id` | Get specific transaction |
| PATCH | `/api/v1/budgets/:budget_id/transactions/:id` | Update transaction |
| DELETE | `/api/v1/budgets/:budget_id/transactions/:id` | Delete transaction |

### Category Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/v1/categories` | List all categories |
| POST | `/api/v1/categories` | Create new category |
| GET | `/api/v1/categories/:id` | Get specific category |
| PATCH | `/api/v1/categories/:id` | Update category |
| DELETE | `/api/v1/categories/:id` | Delete category |

For detailed API request/response examples, see the [README.md](README.md#api-endpoints).

---

## 🆘 Getting Help

### Troubleshooting Common Issues

#### Database Connection Errors

```bash
# Check PostgreSQL is running
sudo service postgresql status

# Recreate database
rails db:drop db:create db:migrate
```

#### Bundle Install Fails

```bash
# Update RubyGems
gem update --system

# Install missing dependencies
bundle install
```

#### npm Install Fails

```bash
# Clear npm cache
npm cache clean --force

# Delete node_modules and reinstall
rm -rf node_modules package-lock.json
npm install
```

#### Port Already in Use

```bash
# Find process using port 3000
lsof -i :3000

# Kill the process
kill -9 <PID>
```

### Need More Help?

- **Check existing issues**: [GitHub Issues](https://github.com/Limeload/SpendWise/issues)
- **Ask a question**: Create a new issue with the `question` label
- **Search documentation**: Review the [README.md](README.md)
- **Contact maintainers**: Tag maintainers in your issue

---

## 📄 License

By contributing to SpendWise, you agree that your contributions will be licensed under the [MIT License](LICENSE.md).

---

## 🙏 Thank You!

Thank you for contributing to SpendWise! Your efforts help make personal finance management accessible and effective for everyone.

**Happy Coding! 💰✨**
