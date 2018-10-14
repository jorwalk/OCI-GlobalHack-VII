import React from 'react';
import { withStyles } from '@material-ui/core/styles';
import IconButton from '@material-ui/core/IconButton';
import { Typography, TextField } from '@material-ui/core';
import OutlinedInput from '@material-ui/core/OutlinedInput';
import FormLabel from '@material-ui/core/FormLabel';
import FormControlLabel from '@material-ui/core/FormControlLabel';
import RadioGroup from '@material-ui/core/RadioGroup'
import Radio from '@material-ui/core/Radio';
import MenuItem from '@material-ui/core/MenuItem';
import FormControl from '@material-ui/core/FormControl';
import Select from '@material-ui/core/Select';
import FA from 'react-fontawesome';
import COUNTRIES from '../constants/countries';

const styles = theme => ({
  root: {
    display: 'flex',
    marginTop: '40px'
  },
  formControl: {
    margin: theme.spacing.unit,
    minWidth: 120,
  },
  selectEmpty: {
    marginTop: theme.spacing.unit * 2,
  },
  box: {
    marginLeft: '20px'
  }
});

class SimpleSelect extends React.Component {
  state = {
    genderChecked: null,
    country: '',
    children: null
  };

  handleChange = event => {
    this.setState({ [event.target.name]: event.target.value });
  };



  render() {
    const { classes } = this.props;
    const {genderChecked} = this.state;

    return (
      <div className={classes.root}>
          <div style={{display: 'flex'}}>
            <div style={{margin: '20px'}}>
              <Typography style={{textAlign: 'center'}}variant="headline">My Gender is:</Typography>
              <div className={classes.box}>
                <IconButton onClick={() => this.setState({genderChecked: 'male'})}>
                  <FA name='male'  style={{fontSize: '90px', color: genderChecked === 'male' ? 'orange': 'gray'}}/>
                </IconButton>
                <IconButton onClick={() => this.setState({genderChecked: 'female'})}>
                  <FA name='female'  style={{fontSize: '90px', color: genderChecked === 'female' ? 'orange': 'gray'}}/>
                </IconButton>
              </div>
            </div>
          <div style={{margin: '20px'}}>
            <div>
              <Typography style={{textAlign: 'center'}} variant="headline">My Age is:</Typography>
              <div className={classes.box}>
                <TextField
                  style={{marginTop: '40px'}}
                  inputProps={{style: {fontSize: '30px', width: '100px', textAlign: 'center'}}}
                  id="outlined-bare"
                  className={classes.textField}
                  defaultValue=""
                  margin="normal"
                  variant="outlined"
                />
              </div>
            </div>
          </div>
          <div style={{margin: '20px'}}>
            <div>
              <Typography style={{textAlign: 'center'}} variant="headline">My Zip Code is:</Typography>
              <div className={classes.box}>
                <TextField
                  style={{marginTop: '40px'}}
                  inputProps={{style: {fontSize: '30px', width: '100px', textAlign: 'center'}}}
                  id="outlined-bare"
                  className={classes.textField}
                  defaultValue=""
                  margin="normal"
                  variant="outlined"
                />
              </div>
            </div>
          </div>
          <div style={{margin: '20px'}}>
            <div>
              <Typography style={{textAlign: 'center'}} variant="headline">My Country of Origin is:</Typography>
              <div className={classes.box}>
              <FormControl variant="outlined">
                  <Select
                    style={{marginTop: '40px', fontSize: '20px', width: '150px', height: '73px'}}
                    name="country"
                    value={this.state.country}
                    onChange={this.handleChange}
                    input={
                      <OutlinedInput
                        name="age"
                        id="outlined-age-simple"
                      />
                    }
                  >
                  {COUNTRIES.map(C => <MenuItem value={C}>{C}</MenuItem>)}
                  </Select>
              </FormControl>
              </div>
            </div>
          </div>
          <div style={{margin: '20px'}}>
            <div>
              <div className={classes.box}>
              <FormControl component="fieldset" className={classes.formControl}>
              <Typography style={{textAlign: 'center'}} variant="headline">Do you have Children?</Typography>
                <RadioGroup
                  aria-label="Gender"
                  name="children"
                  style={{marginLeft: '20px', marginTop: '15px'}}
                  value={this.state.children}
                  onChange={this.handleChange}
                  color="primary"
                >
                  <FormControlLabel value="female" control={<Radio color="primary" />} label="Yes" />
                  <FormControlLabel value="male" control={<Radio color="primary" />} label="No" />
                </RadioGroup>
              </FormControl>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default withStyles(styles)(SimpleSelect);