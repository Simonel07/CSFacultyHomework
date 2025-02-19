USE Gestiunea_Obiectelor_din_Orbita_Pamantului;

-- id-ul, titlul si numarul de misiuni intr-o orbita care au mai mult de o misiune ordonate descrescator; extrage din 3
SELECT ORB.id_orb, ORB.nume, COUNT(M.id_mis) AS [nr misiuni] FROM Orbita ORB INNER JOIN Mis_in_Orb MO ON ORB.id_orb=MO.id_orb INNER JOIN Misiune M 
ON M.id_mis=MO.id_mis GROUP BY ORB.id_orb, ORB.nume HAVING COUNT(MO.id_mis)>1 ORDER BY [nr misiuni] DESC;

-- numele obiectului, id-ul obiectului si numele organizatiei care lanseaza obiectul si incepe cu E; extrage din 3
SELECT S.nume,OB.id_ob,ORG.nume FROM Satelit S INNER JOIN Obiecte OB ON S.id_sat=OB.id_sat INNER JOIN Organizatii ORG ON ORG.id_org=OB.id_lan WHERE ORG.nume LIKE'E%';

-- id-ul, numele tipurilor de sateliti si numarul de sateliti pentru acel tip daca sunt mai mult de 3 sateliti la un tip; extrage din 2
SELECT TS.id_tip_sat, TS.nume, COUNT(S.id_tip_sat) AS [nr tipuri sat] FROM Satelit S INNER JOIN TipSatelit TS ON TS.id_tip_sat=S.id_tip_sat 
GROUP BY TS.id_tip_sat, TS.nume HAVING COUNT(S.id_tip_sat)>3 ORDER BY [nr tipuri sat] DESC;

--codul, numele si tipul satelitului inregistrat in tabela de obiecte care au tipul de satelit diferit de observare; extrage din 3
SELECT S.id_sat, S.nume, TS.nume FROM Obiecte O INNER JOIN Satelit S ON O.id_sat=S.id_sat INNER JOIN TipSatelit TS 
ON TS.id_tip_sat=S.id_tip_sat WHERE TS.nume<>'comunicare';

--codul, numele si numarul de misiuni aflate intr-o anumita orbita, care au mai mult de 1 misiune intr-o orbita ordonate descescator; extrage din 3
SELECT O.id_orb, O.nume, COUNT(O.id_orb) AS [nr genuri] FROM Misiune M INNER JOIN Mis_in_Orb MO ON M.id_mis=MO.id_mis INNER JOIN Orbita O ON MO.id_orb=O.id_orb 
GROUP BY O.id_orb, O.nume HAVING COUNT(O.id_orb)>1 ORDER BY [nr genuri] DESC;

--codul, numele si bugetul unei misiuni aflate in orbita LEO; extrage din 3
SELECT M.id_mis, M.denumire, M.buget FROM Misiune M INNER JOIN Mis_in_Orb MO ON M.id_mis=MO.id_mis INNER JOIN Orbita O ON MO.id_orb=O.id_orb 
WHERE O.nume ='LEO';

--numele  statiitlor care nu sunt construite de NASA; extrage din 3
SELECT DISTINCT ST.nume FROM Statie ST INNER JOIN Obiecte O ON ST.id_st=O.id_st INNER JOIN Organizatii ORG ON ORG.id_org=O.id_con WHERE ORG.nume<>'NASA';

--numele misiunilor care nu sunt in orbita LEO; extrage din 3
SELECT DISTINCT M.denumire FROM Misiune M INNER JOIN Mis_in_Orb MO ON M.id_mis=MO.id_mis INNER JOIN Orbita O ON MO.id_orb=O.id_orb WHERE O.nume<>'LEO';

--denumirea, bugetul si altitudinea misiunii care se afla pe o orbita mai joasa de 2000km; extrage din 3
SELECT M.denumire,M.buget, O.altitudine FROM Misiune M INNER JOIN Mis_in_Orb MO ON M.id_mis=MO.id_mis INNER JOIN Orbita O ON MO.id_orb=O.id_orb WHERE O.altitudine <20000;

--id-ul, numeles si tipul satelitilor care nu sunt de tip "comunicare" sau "observare"; extrage din 3
SELECT S.id_sat, S.nume, TS.nume FROM Obiecte O INNER JOIN Satelit S ON O.id_sat=S.id_sat INNER JOIN TipSatelit TS 
ON S.id_tip_sat=TS.id_tip_sat WHERE TS.nume<>'comunicare' AND TS.nume<>'observare';