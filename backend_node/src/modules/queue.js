module.exports = (io) => {
    const express = require('express');
    const router = express.Router();
    const db = require('../db');
    router.get('/all', async (req, res) => {
        const result = await db.query(`SELECT q.*, p.full_name FROM queue_entries q JOIN appointments a ON q.appointment_id=a.id JOIN patients p ON a.patient_id=p.id`);
        res.json(result.rows);
    });
    return router;
};
