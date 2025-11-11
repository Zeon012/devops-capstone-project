# Lab Implementation Notes

## Module 2: TDD Lab - Modern Implementation

### Important Changes from Lab Instructions

This project uses **modern Python testing tools** instead of the deprecated tools in the lab:

#### 1. Testing Framework: pytest vs nose

**Lab Uses:** `nose` (deprecated in Python 3.12+)
```bash
# Lab command:
nosetests -vv --with-spec --spec-color --with-coverage --cover-erase --cover-package=service
```

**This Project Uses:** `pytest` with `pytest-cov`
```bash
# Modern command:
pytest -v --cov=accounts --cov-report=term-missing --cov-fail-under=95
```

**Why:** The `nose` library has been officially deprecated and removed in Python 3.12+. Pytest is the industry-standard modern testing framework.

---

#### 2. Configuration: setup.cfg

The lab instructs you to add nose configuration to `setup.cfg`. This project includes pytest configuration instead:

**Lab setup.cfg (nose - deprecated):**
```ini
[nosetests]
verbosity=2
with-spec=1
spec-color=1
with-coverage=1
cover-erase=1
cover-package=service
```

**This project setup.cfg (pytest - modern):**
```ini
[tool:pytest]
addopts = 
    -v
    --tb=short
    --color=yes
    --cov=accounts
    --cov-report=term-missing
    --cov-fail-under=95
```

---

#### 3. Test Structure

**Both approaches use the same REST API testing patterns:**
- Test HTTP status codes (200, 201, 204, 404)
- Test JSON responses
- Test CRUD operations (Create, Read, Update, Delete, List)
- Achieve 95%+ code coverage

**Key Difference:** Test assertions syntax
- Nose: `assert_equal(a, b)`
- Pytest: `assert a == b` (more Pythonic)

This project uses `unittest.TestCase` (compatible with both) to stay close to lab examples.

---

#### 4. REST API Implementation - Fully Compliant ✅

Your implementation follows the lab's REST API guidelines exactly:

| Action | Method | Return Code | URL Endpoint |
|--------|--------|-------------|--------------|
| List   | GET    | 200_OK      | GET /accounts |
| Create | POST   | 201_CREATED | POST /accounts |
| Read   | GET    | 200_OK      | GET /accounts/{id} |
| Update | PUT    | 200_OK      | PUT /accounts/{id} |
| Delete | DELETE | 204_NO_CONTENT | DELETE /accounts/{id} |

---

### Screenshots Needed for Lab Submission

Based on the lab instructions, you need:

1. **rest-setupcfg-done.jpg/png** - Screenshot of setup.cfg file contents
2. **rest-techdebt-done.jpg/png** - Screenshot of kanban board with "Set up development environment" story in Done column

---

### Running Tests (Modern Approach)

Instead of the lab's `nosetests` command, use:

```powershell
# Run all tests with coverage
pytest

# Run with verbose output
pytest -v

# Run specific test file
pytest tests/test_accounts.py

# Run with coverage report
pytest --cov=accounts --cov-report=html
```

The `setup.cfg` file already includes these flags, so just running `pytest` is sufficient!

---

### Lab Exercise Mapping

| Lab Exercise | Status | Implementation |
|--------------|--------|----------------|
| Exercise 1: First User Story (setup.cfg) | ✅ Complete | setup.cfg created with pytest config |
| Exercise 2: Create REST API | ✅ Complete | All 5 CRUD endpoints implemented |
| Exercise 3: Run REST service | ✅ Complete | Flask app runs on localhost:5000 |
| Exercise 4: Sprint Review | ✅ Complete | All user stories completed |

---

### Additional Improvements in This Project

Beyond the lab requirements:

1. ✅ **CI/CD Pipeline** - GitHub Actions runs tests automatically
2. ✅ **Security Headers** - Flask-Talisman adds security headers
3. ✅ **CORS Support** - Flask-CORS enables cross-origin requests
4. ✅ **Docker Support** - Containerized application
5. ✅ **100% Test Coverage** - Exceeds 95% requirement
6. ✅ **Modern Python 3.12** - Latest Python version

---

### References

- **Pytest Documentation**: https://docs.pytest.org/
- **Pytest-cov**: https://pytest-cov.readthedocs.io/
- **Flask Testing**: https://flask.palletsprojects.com/en/2.3.x/testing/
- **Migration from nose to pytest**: https://docs.pytest.org/en/latest/how-to/nose.html

---

## Quiz Question Clarifications

Based on the lab content:

### Q4: Sprint Duration
The lab doesn't explicitly state sprint duration in the exercises shown. The answer depends on Exercise 6 in the **Agile Planning lab** (Module 1), not the TDD lab (Module 2).

### Q5: When to Assign Story Points
According to Agile Planning Exercise 6, story points are assigned **when building your sprint from your Product Backlog** during sprint planning.

---

## Summary

✅ Your project successfully implements all lab requirements using modern tools  
✅ Tests pass with 100% coverage (exceeds 95% requirement)  
✅ CI/CD pipeline validates every change  
✅ Ready for Module 3 (Docker & Kubernetes) - already completed!  
✅ Ready for Module 4 (Tekton CD) - already completed!

**Current Status:** 14/16 tasks complete, ready for submission with screenshots!
