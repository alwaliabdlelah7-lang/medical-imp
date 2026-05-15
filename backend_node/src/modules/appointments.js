module.exports = (io) => {
    const express = require('express');
    const router = express.Router();
    const db = require('../db');
    router.get('/', async (req, res) => {
        const result = await db.query(`SELECT a.*, p.full_name as patient_name FROM appointments a JOIN patients p ON a.patient_id=p.id`);
        res.json(result.rows);
    });
    return router;
};
