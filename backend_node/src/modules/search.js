const express = require('express');
const router = express.Router();
const db = require('../db');
router.get('/', async (req, res) => {
    const { q } = req.query;
    const result = await db.query(`SELECT id, full_name, phone FROM patients WHERE full_name ILIKE $1 LIMIT 10`, [`%${q}%`]);
    res.json(result.rows);
});
module.exports = router;
