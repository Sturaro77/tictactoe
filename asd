#include <iostream>
#include <conio.h>

using namespace std;

void ispisMatrice();
void ispisPloce();
int noviZnak();
int provjera();

char ploca[3][3]= {' ', ' ', ' ',
					' ', ' ', ' ',
					' ', ' ', ' ',};
int red = 1; // 1 - Igrac 1 | 0 - Igrac 2
char znak = 'O'; //0 - Igrac 1 | X - Igrac 2
int unos;

int main(){
	int pob = 0;
	int pravilanUnos = 0;
	
	for(int i=0;i<9;i++){
		system("cls");
		ispisPloce();
		if(red) cout <<"Igrac 1 (Kruzic)" << endl;
		else cout << "Igrac 2 (krizic)" << endl;
		ispisMatrice();
		cout << "Unesite znak na zeljeno mjesto: ";
		cin>>unos;
		while(unos<0 || unos>9){
			cout << "Pogresan unos. Ponovi: ";
			cin >> unos;
		}
		if(red) znak= 'O';
		else znak = 'X';
		
		pravilanUnos=noviZnak();
		if(!pravilanUnos){
			i--;
			continue;
		}
		pob=provjera();
		if(pob){
			system("cls");
			ispisPloce();
			if(red) cout << endl << "POBJEDNIK JE --- IGRAC 1!";
			else cout << endl << "POBJEDNIK JE --- IGRAC!";
			getch();
			break;
		}
		
		if(i==8){
			system("cls");
			ispisPloce();
			cout << endl << "Nemamo pobjednika.";
		}
		red = !red;
	}
	return 0;
}

void ispisMatrice(){
	cout << endl << endl << "Matrica za unos" << endl;
	cout << " 1 | 2 | 3 " << endl;
	cout << "-----------" << endl;
	cout << " 4 | 5 | 6 " << endl;
	cout << "-----------" << endl;
	cout << " 7 | 8 | 9 " << endl;
}


void ispisPloce(){
	cout << " "<<ploca[0][0]<< " | " << ploca[0][1]<< " | " << ploca[0][2]<<" " << endl;
	cout << "-----------" << endl;
	cout << " "<<ploca[1][0]<< " | " << ploca[1][1]<< " | " << ploca[1][2]<<" " << endl;
	cout << "-----------" << endl;
	cout << " "<<ploca[2][0]<< " | " << ploca[2][1]<< " | " << ploca[2][2]<<" " << endl;
}

int noviZnak(){
	for(int i=0,k=1;i<3;i++){
		for(int j=0;j<3;j++,k++){
			if(k==unos)
				if(ploca[i][j]==' '){
					ploca[i][j]=znak;
					return 1;
				}
				else{
					cout << "Pogresan unos";
					getch();
					return 0;
				}
		}
	}
}

int provjera(){
	//provjera po redovima
	if(ploca[0][0]==znak && ploca[0][1]==znak && ploca[0][2]==znak)
		return 1;
	if(ploca[1][0]==znak && ploca[1][1]==znak && ploca[1][2]==znak)
		return 1;
	if(ploca[2][0]==znak && ploca[2][1]==znak && ploca[2][2]==znak)
		return 1;
		
	//provjera po stupcima
	if(ploca[0][0]==znak && ploca[1][0]==znak && ploca[2][0]==znak)
		return 1;
	if(ploca[0][1]==znak && ploca[1][1]==znak && ploca[2][1]==znak)
		return 1;
	if(ploca[0][2]==znak && ploca[1][2]==znak && ploca[2][2]==znak)
		return 1;
		
	//provjera po dijagonali
	if(ploca[0][0]==znak && ploca[1][1]==znak && ploca[2][2]==znak)
		return 1;
	if(ploca[0][2]==znak && ploca[1][1]==znak && ploca[2][0]==znak)
		return 1;
	return 0;
}
