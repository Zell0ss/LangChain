create (:Product {id: "PROD123", name: "Wireless Headphones", category: "Electronics", price: 199.99}),
(:Category {name: "Electronics", parentCategory: "Technology"}),
(:Order {id: "ORD456", date: "2024-01-20", total: 399.98, status: "Completed"}),
(:Review {id: "REV789", rating: 5, text: "Excellent quality!", date: "2024-01-25"}), 
(:Customer {id: 12345, name: "Alice Johnson", email: "alice@email.com", registrationDate: "2023-01-15"})

MATCH (o:Order {id: "ORD456"}),(p:Product {id: "PROD123"})
CREATE (o)-[:CONTAINS {quantity: 2, unitPrice: 199.99}]->(p)
RETURN o,p;

MATCH (customer:Customer {name: "Alice Johnson"}),(review:Review {id: "REV789"}),(product:Product {id: "PROD123"})
CREATE (customer)-[:REVIEWED {helpfulVotes: 15}]->(review)-[:ABOUT]->(product)
RETURN customer, review, product;

MATCH (category:Category {name: "Electronics"}),(product:Product {id: "PROD123"})
CREATE (product)-[:BELONGS_TO]->(category)
RETURN product, category;

MATCH (customer:Customer {name: "Alice Johnson"}),(product:Product {id: "PROD123"})
CREATE (customer)-[:VIEWED {timestamp: "2024-01-19T15:22:00", duration: 120}]->(product)
RETURN customer,product;


MATCH ()-[r]-()
WHERE ID(r) = 6917532326175965189
DELETE r

MATCH (n)
WHERE elementId(n) = "4:1b9ee9ba-82c6-496b-84fb-28cb4a56943a:5"
DETACH DELETE n;