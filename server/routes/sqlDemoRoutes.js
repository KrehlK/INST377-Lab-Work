import express from 'express';
import sequelize from 'sequelize';
import chalk from 'chalk';
import fetch from 'node-fetch';

import db from '../database/initializeDB.js';
import hallIdQuery from '../controllers/diningHall.js';
import mealsQuery from '../controllers/meals_query.js';

const router = express.Router();

router.route('/foodServicesPG/:id')
  .get()

router.route('/')
  .get(async (req, res) => {
    try {
      console.log('touched sqlDemo get');
      const result = await db.sequelizeDB.query(mealsQuery, {
        type: sequelize.QueryTypes.SELECT
      });
      res.json({ data: result });
    } catch (error) {
      console.log(' sqlDemo get error', error);
      res.json({ message: 'error in sqldemo' });
    }
  })
  .post(async (req, res) => {
    // TODO original: Error: Table
    // 'Dining_Hall_Tracker.Meals_Locations' doesn't exist
    try {
      console.log(req.body);
      console.log(req.body?.dining);
      const hallId = req.body?.dining || 0;
      const result = await db.sequelizeDB.query(hallIdQuery, {
        replacements: { hall_id: hallId },
        type: sequelize.QueryTypes.SELECT
      });
      res.json({ data: result });
    } catch (err) {
      console.log(err);
      res.send({ message: 'Something went wrong on the SQL request' });
    }
  });

export default router;