// App = { 
//     loading: false, 
//     contracts: {}, 
   
//     load: async () => {
//       await App.loadWeb3()
//       await App.loadAccount()
//       await App.loadCornShop()
//     }, 
   
//     // https://medium.com/metamask/https-medium-com-metamask-breaking-change-injecting-web3-7722797916a8 
//     loadWeb3: async () => { 
//       if (typeof web3 !== 'undefined') { 
//         App.web3Provider = web3.currentProvider 
//         web3 = new Web3(web3.currentProvider) 
//       } else { 
//         window.alert("Please connect to Metamask.") 
//       } 
//       // Modern dapp browsers... 
//       if (window.ethereum) { 
//         window.web3 = new Web3(ethereum) 
//         try { 
//           // Request account access if needed 
//           await eth_requestAccounts
//           // Acccounts now exposed 
//           web3.eth.sendTransaction({/* ... */}) 
//         } catch (error) { 
//           // User denied account access... 
//         } 
//       } 
//       // Legacy dapp browsers... 
//       else if (window.web3) { 
//         App.web3Provider = web3.currentProvider 
//         window.web3 = new Web3(web3.currentProvider) 
//         // Acccounts always exposed 
//         web3.eth.sendTransaction({/* ... */}) 
//       } 
//       // Non-dapp browsers... 
//       else { 
//         console.log('Non-Ethereum browser detected. You should consider trying MetaMask!') 
//       } 
//     }, 
   
//     loadAccount: async () => { 
//       // Set the current blockchain account
//       web3.eth.getAccounts().then(e => console.log(e[0]));
//     },

//     loadCornShop: async() => {
//         const shop = await $.getJSON('CornShop.json')
//         console.log(shop)
//     }
//   } 
   
//   $(() => { 
//     $(window).load(() => { 
//       App.load() 
//     }) 
//   })