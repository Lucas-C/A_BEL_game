.. -*- coding: utf-8 -*-

.. _contact: lucas.cimon__AT__ensimag.fr

======
README
======

.. contents::


Description
===========

Git repository for a small flash game.


Game concept
============
- Map = grille ~bomberman
- Obstacles destructibles
- Rushes du perso peremttant de traverser murs
- Labyrinthe
- Monstres poursuivant perso => nécessiter de les bloquer => créer obstacles
- Eau/Vague de monstres provenant du bas => nécessiter d'avancer ! (~> perso essaie de se réfugier dans un temple après avoir réveillé un dieu maléfique ?)
- PNJ/objets pouvant être tués/détruits ou non => messages instantannés + change déroulement scénaristique


SKYPE 30/11/11
==============
- random tiles (plusieurs types de coins/croix/pan de mur choisis aléatoirement)
- zoom level (contrôle global !) -> sprites : 32x32 pixels
- spritesheets


Tasks
=====
- grille
- personnage -> déplacement & animation
- rushes & destruction obstacles
- ennemis
- joueur supplémentaire


FLASHPUNK:
==========
- http://flashgamedojo.com/go/
- FlashDevelop-4.0.0-Beta3
- flashplayer_10_sa_debug
- Draknek-FlashPunk-adbf544


PB:
===
- Comment donner à Elliot la possibilité de tester ?
-> FlashDevelop with virtualBox under Mac


REUNION CONCEPTION 1/12/11
==========================

dT global
pos:Number
charger fichiers - level (XML) => editeur ?
nouveau mouvement : se glisser dans une diagonale comme une souris
animation du perso : verti/horiz comme Zelda aLttP & dépend seulement de 1ere touche dir pressée
bounding box : carré (=> afficher en mode Debug)
+ glisser sur obstacles (déplacement latéral vers trou proche si trou existe)
gestion double touche pressée : les deux mvmt appliqués dans la même frame
-> renormaliser le mouvement diagonal
rush diagonal
obstacles émettant un souffle ?
class Tile => si hérite de Entity, level ~ 30x500x20 sizeof(pointeur)
=> "smart" progressive loading ?
