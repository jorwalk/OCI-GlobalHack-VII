import React from 'react';
import { withStyles } from '@material-ui/core/styles';
import Paper from '@material-ui/core/Paper';
import AppBar from '../components/appBar';
import Typography from '@material-ui/core/Typography';
import Divider from '@material-ui/core/Divider'
import Dialog from './dialog';
import DetailForm from './detailsForm';
import Button from '@material-ui/core/Button';
import Chatbot from './chatBot';

const styles = () => ({
  root: {
  padding: '2%',
  margin: '2%',
  display: 'flex',
  justifyContent: 'space-between'
  }
});

class FormPage extends React.Component {
  onSubmit = (e) => console.log(e);
  render() {
    const {classes } = this.props;
    return (
      <div>
      <AppBar />
      <Paper className={classes.root} elevation={1}>
        <div style={{marginRight: '100px'}}>
          <Dialog />
          <Typography variant="h4">Tell Us About Yourself</Typography>
          <Typography variant="h6">We will use this information to make recommendations. We do not share this information with anyone.</Typography>
          <Divider style={{marginTop: '10px'}} />
          <div style={{marginTop: '10px'}}>
            <DetailForm />
          </div>
          <div style={{display: 'flex', flexDirection: 'row-reverse'}}>
            <Button variant="contained" color="primary" style={{color: 'white', fontSize: '18px', marginLeft: '20px'}}>Next</Button>
          </div>
        </div>
      </Paper>
      <Chatbot />
    </div>
    )
  }
}

export default withStyles(styles)(FormPage);