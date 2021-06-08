import React from 'react';
import { SafeAreaView, StyleSheet, TextInput, Text, TouchableOpacity, Image } from 'react-native';

import firebase from '../../firebase/firebase';


export default function Login({ navigation }) {


    const [email, setEmail] = React.useState('');
    const [password, setPassword] = React.useState('');

    function enterInFirebase() {

        firebase.auth().signInWithEmailAndPassword(email, password)
            .then((userCredential) => {
                // Signed in
                var user = userCredential.user;
               alert ("Logado")
            })
            .catch((error) => {
                var errorCode = error.code;
                var errorMessage = error.message;
                alert("Senha ou E'mail incorretos. Tente novamente")
            });

    }

    return (
        <SafeAreaView style={styles.container}>

            <TextInput
                style={styles.input01}
                onChangeText={setEmail}
                value={email}
                placeholder="E'mail"
            />

            <TextInput
                style={styles.input02}
                onChangeText={setPassword}
                value={password}
                placeholder="Senha"
            />

            <TouchableOpacity
                style={styles.button}
                activeOpacity={.5}
                onPress={ ()  => enterInFirebase()}>
                <Text style={styles.textStyle}> Entrar </Text>
            </TouchableOpacity>

          
        </SafeAreaView>
    );

};
const styles = StyleSheet.create({
    container: {
        flex: 1,

        backgroundColor: 'white',
        alignItems: 'center',
        justifyContent: 'center'
    },

    input01: {
        borderBottomWidth: 1,
        padding: 10,
        height: 40,
        margin: 12,
        borderWidth: 1,
        width: 300,
        alignItems: 'center',
        justifyContent: 'center',

    },

    input02: {
        borderBottomWidth: 1,
        padding: 10,
        height: 40,
        margin: 12,
        borderWidth: 1,
        width: 300,
        alignItems: 'center',
        justifyContent: 'center',

    },

    button: {
        marginTop: 10,
        paddingTop: 15,
        paddingBottom: 15,
        marginLeft: 30,
        marginRight: 30,
        backgroundColor: 'green',
        borderRadius: 200,
        borderWidth: 2,
        width: 130,
        borderColor: 'green'
    },

    textStyle: {
        color: 'white',
        textAlign: 'center',
    },

  
})
