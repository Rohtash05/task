CREATE TABLE Graphs (
    GraphID INTEGER Primary Key,
    GraphName VarChar2(255)
);

CREATE TABLE Vertices (
    VertexID INTEGER Primary Key,
    VertexName VarChar2(255),
    Graph INTEGER, FOREIGN KEY(Graph) REFERENCES Graphs(GraphID)
);

CREATE TABLE Edges(
    EdgeID INTEGER Primary Key,
    SourceVertex INTEGER,
    TargetVertex INTEGER,
    FOREIGN KEY(SourceVertex) REFERENCES Vertices(VertexID),
    FOREIGN KEY(TargetVertex) REFERENCES Vertices(VertexID)
);

INSERT INTO Graphs(GraphName) Values ('Graph1');
INSERT INTO Graphs(GraphName) Values ('Graph2');

INSERT INTO Vertices(VertexName, Graph) Values ("A",1);
INSERT INTO Vertices(VertexName, Graph) Values ("B",1);
INSERT INTO Vertices(VertexName, Graph) Values ("C",1);
INSERT INTO Vertices(VertexName, Graph) Values ("D",1);
INSERT INTO Vertices(VertexName, Graph) Values ("A",2);
INSERT INTO Vertices(VertexName, Graph) Values ("B",2);
INSERT INTO Vertices(VertexName, Graph) Values ("C",2);

INSERT INTO Edges(SourceVertex, TargetVertex) Values (1,2);
INSERT INTO Edges(SourceVertex, TargetVertex) Values (1,2);
INSERT INTO Edges(SourceVertex, TargetVertex) Values (2,1);
INSERT INTO Edges(SourceVertex, TargetVertex) Values (2,4);
INSERT INTO Edges(SourceVertex, TargetVertex) Values (4,4);
INSERT INTO Edges(SourceVertex, TargetVertex) Values (5,6);
INSERT INTO Edges(SourceVertex, TargetVertex) Values (5,7);
INSERT INTO Edges(SourceVertex, TargetVertex) Values (7,7);
INSERT INTO Edges(SourceVertex, TargetVertex) Values (6,7);

-- Total No of Graphs
Select Count(GraphID) from Graphs;
--
-- -- No of verticies of each graph
SELECT Graph, COUNT(VertexID) FROM Vertices GROUP BY Graph;
--
-- -- Degree of Each Vertex in Each Graph
SELECT SourceVertex ,COUNT(EdgeID) FROM Edges GROUP BY SourceVertex;

-- Average of Degree
SELECT a2.graph as graphID, a3.graphname, CAST(a1.edgeid as float)/CAST(a2.vertexid as float)
    as result from (SELECT t2.graph, Count(distinct EdgeID) as edgeid
FROM edges t1, Vertices t2 where t1.SourceVertex = t2.VertexID OR t1.TargetVertex = t2.VertexID group by 1) as a1,
            (SELECT Vertices.graph as graph, COUNT(VertexID) as vertexid FROM Vertices group by 1) as a2 , Graphs a3 where a1.Graph = a2.graph and a2.graph=a3.GraphID;