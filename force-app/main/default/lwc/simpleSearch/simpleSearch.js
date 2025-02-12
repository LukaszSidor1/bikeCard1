import { LightningElement, track } from 'lwc';
import searchAccounts from '@salesforce/apex/AccountSearchController.searchAccounts';

export default class AccountSearch extends LightningElement {
    @track accounts = [];
    @track error;
    searchTerm = '';

    // Update the search term as the user types
    handleInputChange(event) {
        this.searchTerm = event.target.value;
    }

    // Fetch results when the search button is clicked
    handleSearch() {
        if (this.searchTerm.trim() === '') {
            this.accounts = [];
            this.error = 'Please enter a search term.';
            return;
        }

        searchAccounts({ searchTerm: this.searchTerm })
            .then((result) => {
                this.accounts = result;
                this.error = undefined;
            })
            .catch((error) => {
                this.accounts = [];
                this.error = 'An error occurred while searching.';
                console.error(error);
            });
    }
}
