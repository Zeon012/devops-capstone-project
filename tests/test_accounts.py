import unittest

from accounts import create_app
from accounts.routes import _reset_store


class AccountsTestCase(unittest.TestCase):
    def setUp(self):
        app = create_app({'TESTING': True})
        self.app = app.test_client()
        _reset_store()

    def test_create_and_get_account(self):
        # create
        rv = self.app.post('/accounts', json={'name': 'Alice', 'email': 'a@example.com'})
        self.assertEqual(rv.status_code, 201)
        data = rv.get_json()
        self.assertIn('id', data)

        acc_id = data['id']
        # get
        rv = self.app.get(f'/accounts/{acc_id}')
        self.assertEqual(rv.status_code, 200)
        got = rv.get_json()
        self.assertEqual(got['name'], 'Alice')

    def test_list_accounts(self):
        # no accounts initially
        rv = self.app.get('/accounts')
        self.assertEqual(rv.status_code, 200)
        self.assertEqual(rv.get_json(), [])

    def test_update_account(self):
        rv = self.app.post('/accounts', json={'name': 'Bob'})
        acc_id = rv.get_json()['id']
        rv = self.app.put(f'/accounts/{acc_id}', json={'name': 'Robert', 'email': 'r@example.com'})
        self.assertEqual(rv.status_code, 200)
        got = rv.get_json()
        self.assertEqual(got['name'], 'Robert')

    def test_delete_account(self):
        rv = self.app.post('/accounts', json={'name': 'ToDelete'})
        acc_id = rv.get_json()['id']
        rv = self.app.delete(f'/accounts/{acc_id}')
        self.assertEqual(rv.status_code, 204)
        # ensure gone
        rv = self.app.get(f'/accounts/{acc_id}')
        self.assertEqual(rv.status_code, 404)

    def test_security_headers_and_cors(self):
        rv = self.app.get('/accounts')
        # Flask-Talisman should add security headers (CSP may be absent since scaffold set to None)
        self.assertTrue('Content-Security-Policy' in rv.headers or 'X-Content-Type-Options' in rv.headers)
        # CORS should add Access-Control-Allow-Origin
        self.assertIn('Access-Control-Allow-Origin', rv.headers)


if __name__ == '__main__':
    unittest.main()
