import { ethers } from "ethers";

// 1. Conectar con MetaMask
const provider = new ethers.BrowserProvider(window.ethereum);

async function conectarWallet() {
    // Pide permiso al usuario para acceder a sus cuentas
    await provider.send("eth_requestAccounts", []);
    const signer = await provider.getSigner();
    console.log("Conectado con:", await signer.getAddress());
    return signer;
}

// 2. Instanciar el contrato
const contratoDireccion = "0xTuDireccionDelProxy"; // Dirección de tu contrato
const abi = [ /* acá va el JSON de la ABI que te da Remix */ ];

async function obtenerTotalCertificados() {
    const contrato = new ethers.Contract(contratoDireccion, abi, provider);
    const total = await contrato.totalCertificados();
    console.log("Total en la blockchain:", total.toString());
}

async function firmarCertificado(alumnoAddr, hashCert) {
    const signer = await provider.getSigner();
    const contrato = new ethers.Contract(contratoDireccion, abi, signer);
    
    // Esto dispara MetaMask
    const tx = await contrato.registrarCertificado(hashCert);
    await tx.wait(); // Esperamos a que se mine la transacción
    console.log("Certificado registrado con éxito!");
}