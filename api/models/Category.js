/**
 * Category.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

    attributes: {
        category_name: {
            type: 'string',
            unique: 'true'
        },
        
        subcategories: {
            collection: 'subcategory',
            via: 'category'
        },
        
        products: {
            collection: 'product',
            via: 'category'
        },
        
        removed: {
            type: 'boolean',
            defaultsTo: 'false'
        }
    }
};

