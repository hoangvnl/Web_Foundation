const db = require('../../utils/db')
const TBL_SUBCATEGORIES = 'subcategory'; 

module.exports = {
  all() {
    return db.load(`select * from ${TBL_SUBCATEGORIES}`);
  },

  async isDeletable(subCatID) {
    var rows = await db.load(`select * from course where SubCategoryID = ${subCatID}`);
    if(rows.length === 0) {
      return true;
    }
    return false;
  },

  add(entity) {
    return db.add(entity, TBL_SUBCATEGORIES); 
  },

  async single(id) {
    const rows = await db.load(`select * from ${TBL_SUBCATEGORIES} where SubcategoryID = ${id}`);
    // const rows = await db.load(`select * from ${TBL_CATEGORIES} where CatID = ${id}`);
    if(rows.length === 0) {
      return null;
    }
    return rows[0];
  },

  del(entity) {
    const condition = {SubcategoryID: entity.SubcategoryID};
    return db.del(condition, TBL_SUBCATEGORIES); 
  },

  patch(entity) {
    const condition = {SubcategoryID: entity.SubcategoryID};
    delete entity.SubcategoryID;
    return db.patch(entity, condition, TBL_SUBCATEGORIES);
  }

};