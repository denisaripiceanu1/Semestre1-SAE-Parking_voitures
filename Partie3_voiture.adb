with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body voiture is
   --lit les informations d'une voiture v de type Type Voiture
   procedure lire_voiture (v : out Type_Voiture) is
      i : Integer;
   begin
      Put
        ("Introduire les 9 caracteres correspondant au numero d'immatriculation : ");
      i := 1;
      while i <= TAILLE_MAX loop
         Get (v.num (i));
         i := i + 1;
      end loop;
      if i /= 10 then
         Put ("ERROR");
      else
         Put ("Introduire la place du parking :");
         Get (v.place);
         while v.place <= 0 loop
            Put_Line ("La valeur saisie n'est pas valide!");
            Put ("Introduire une nouvelle valeur pour la place de parking : ");
            Get (v.place);
         end loop;

         Put ("Introduire l'heure d'arrivée :");
         Get (v.heureEntree_h);
         while v.heureEntree_h < 0 or v.heureEntree_h >= 24 loop
            Put_Line ("La valeur saisie n'est pas valide!");
            Put ("Introduire une nouvelle valeur pour l'heure d'arrivée : ");
            Get (v.heureEntree_h);
         end loop;
         Put ("Introduire les minutes d'arrivée :");
         Get (v.heureEntree_m);
         while v.heureEntree_m < 0 or v.heureEntree_m > 59 loop
            Put_Line ("La valeur saisie n'est pas valide!");
            Put
              ("Introduire une nouvelle valeur pour les minutes d'arrivée : ");
            Get (v.heureEntree_m);
         end loop;
         New_Line;
      end if;
   end lire_voiture;

   -- affiche toutes les informations d'une voiture v de type Type Voiture
   procedure afficher_voiture (v : in Type_Voiture) is
      i : Integer; -- compteur pour le tableau
   begin
      Put_Line ("####################################################### ");
      Put_Line ("###################Informations ####################### ");
      Put_Line ("####################################################### ");
      New_Line;
      i := 1;
      Put ("La voiture avec numero d'immatriculation : ");
      while i <= TAILLE_MAX loop
         Put (v.num (i));
         i := i + 1;
      end loop;
      New_Line;
      Put ("est stationée à la place de parking : ");
      Put (v.place);
      New_Line;
      Put ("et son heure d'arrivée est :  ");
      Put (v.heureEntree_h);
      Put ("h: ");
      Put (v.heureEntree_m);
      Put ("m ");
      New_Line;
   end afficher_voiture;

   --comparer les informations de deux voitures v1 et v2 de type Type Voiture
   function egalite (v1 : in Type_Voiture; v2 : in Type_Voiture) return Boolean
   is
      i : Integer; -- compteur pour le tableau
   begin
      i := 1;
      while i <= 9 and then v1.num (i) = v2.num (i) loop
         i := i + 1;
      end loop;

      if i > 9 then
         return True;
      else
         return False;
      end if;
   end egalite;

   --retourne la valeur de matricule d'une voiture v de type Type Voiture
   function obtenir_matricule (v : in Type_Voiture) return CharArray is
   begin
      return v.num;
   end obtenir_matricule;

   function obtenir_num_place (v : in Type_Voiture) return Integer is
   begin
      return v.place;
   end obtenir_num_place;

   function calculer_duree_stationnement (v : in Type_Voiture) return Integer
   is
      dateE         : Integer;
      heureSortie_h : Integer;
      heureSortie_m : Integer;
      dateS         : Integer;
      duree         : Integer;
   begin
      Put ("Heure de sortie : ");
      Get (heureSortie_h);
      Put ("Minut de sortie : ");
      Get (heureSortie_m);
      New_Line;
      dateE := v.heureEntree_h * 3_600 + v.heureEntree_m * 60;
      dateS := heureSortie_h * 3_600 + heureSortie_m * 60;
      duree := dateS - dateE;
      return duree;
   end calculer_duree_stationnement;

end voiture;
